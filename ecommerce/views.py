from django.shortcuts import render, redirect, get_object_or_404
from django.contrib import messages
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.decorators import login_required
from django.http import HttpResponseRedirect
from django.db import IntegrityError
from django.db.models import Avg
from decimal import Decimal
from django.urls import reverse
from django.views import View
from django.core.exceptions import PermissionDenied

from datetime import datetime, timedelta
from itertools import groupby
from operator import attrgetter

from .models import Produto, UsuarioComum, Loja, Categoria, Wishlist, Avaliacao, Carrinho, ItemCarrinho, Endereco, SelecaoEnderecoUsuario, Cupom, Pedido
from entregas.models import Entrega, EntregaAgendada
from . import forms
from . import utils
from .decorators import usuario_comum_required


class UsuarioComumLoginView(View):

    def get(self, request):
        form = forms.UsuarioComumLoginForm()
        return render(request, "ecommerce/login.html", {
            "form": form
        })

    def post(self, request):
        form = forms.UsuarioComumLoginForm(request.POST)
        if form.is_valid():
            email = form.cleaned_data['email']
            password = form.cleaned_data['password']
            user = authenticate(request, email=email, password=password)
            if user:
                login(request, user)
                return redirect("ecommerce:index")
            
        return render(request, "ecommerce/login.html", {
            "form": form,
            "error": "Usuário e/ou senha inválidos"
        })


class UsuarioComumLogoutView(View):
    def dispatch(self, request, *args, **kwargs):
        # Verifique se o usuário está autenticado e se é apenas um usuário comum
        if not request.user.is_authenticated or request.user.is_motorista or request.user.is_lojista:
            raise PermissionDenied  # Retorna erro 403 se não for um usuário comum
        return super().dispatch(request, *args, **kwargs)

    def get(self, request):
        logout(request)
        return redirect("ecommerce:login")


def register(request):
    if request.method == "POST":
        email = request.POST["email"]
        telefone = request.POST["telefone"]
        nome = request.POST["nome"]
        cpf = request.POST["cpf"]

        # Garantir que a senha e a confirmação sejam os mesmos
        password = request.POST["password"]
        confirmation = request.POST["confirmation"]
        if password != confirmation:
            return render(request, "ecommerce/register.html", {
                "message": "Senhas não batem."
            })
        
        # Checar se o email já existe
        if UsuarioComum.objects.filter(email=email).exists():
            return render(request, "ecommerce/register.html", {
                "message": "E-mail já cadastrado."
            })
        
        # Checar se o CPF já existe
        if UsuarioComum.objects.filter(cpf=cpf).exists():
            return render(request, "ecommerce/register.html", {
                "message": "CPF já cadastrado."
            })
        
        # Checar se o telefone já existe
        if UsuarioComum.objects.filter(telefone=telefone).exists():
            return render(request, "ecommerce/register.html", {
                "message": "Telefone já cadastrado."
            })

        # Tentativa de cadastrar novo usuário
        try:
            user = UsuarioComum.objects.create_user(
                email=email,
                password=password,
                nome=nome,
                cpf=cpf,
                telefone=telefone
            )
            user.save()
        except IntegrityError:
            return render(request, "ecommerce/register.html", {
                "message": "Erro ao tentar criar o usuário. Tente novamente."
            })
        
        login(request, user, backend='ecommerce.backends.UsuarioComumBackend')

        return HttpResponseRedirect(reverse("ecommerce:index"))
    else:
        return render(request, "ecommerce/register.html")


def categorias(request):
    return render(request, 'ecommerce/lista_categorias.html', {
        'categorias': Categoria.objects.all()
    })


# PRODUTOS


def index(request):
    return render(request, "ecommerce/index.html", {
        "produtos": Produto.objects.all()
    })


def produtos_categoria(request, id_categoria):
    categoria = get_object_or_404(Categoria, id=id_categoria)
    produtos = Produto.objects.filter(categoria=categoria)

    return render(request, 'ecommerce/produtos_categoria.html', {
        'categoria': categoria,
        'produtos': produtos
    })


def lojas(request):
    return render(request, 'ecommerce/lista_lojas.html', {
        'lojas': Loja.objects.all()
    })


def produtos_loja(request, id_loja):
    loja = get_object_or_404(Loja, id=id_loja)
    produtos = Produto.objects.filter(loja=loja)

    return render(request, 'ecommerce/produtos_loja.html', {
        'loja': loja,
        'produtos': produtos
    })


def detalhes_produto(request, id_produto):
    produto = get_object_or_404(Produto, id=id_produto)

    in_wishlist = False
    form_avaliacao = None
    usuario_ja_avaliou = False

    # Lógica da Wishlist e Fazer Avaliacoes
    if request.user.is_authenticated and not request.user.is_lojista and not request.user.is_motorista:
        in_wishlist = Wishlist.objects.filter(user=request.user, produto=produto).exists()
        form_avaliacao = forms.FormAvaliacao()
        usuario_ja_avaliou = Avaliacao.objects.filter(produto=produto, user=request.user).exists()

    # Avaliacoes
    avaliacoes = Avaliacao.objects.filter(produto=produto)

    return render(request, 'ecommerce/detalhes_produto.html', {
        'produto': produto,
        'in_wishlist': in_wishlist,
        'usuario_ja_avaliou': usuario_ja_avaliou,
        'avaliacoes': avaliacoes,
        'form': form_avaliacao
    })


# WISHLIST


@usuario_comum_required
def wishlist(request):
    produtos = Produto.objects.filter(wishlist__user=request.user)
    return render(request, 'ecommerce/lista_de_desejos.html', {
        'produtos': produtos
    })


@usuario_comum_required
def acionar_wishlist(request, id_produto):
    produto = get_object_or_404(Produto, id=id_produto)
    wishlist_item = Wishlist.objects.filter(user=request.user, produto=produto).first()

    if wishlist_item:
        wishlist_item.delete()
    else:
        Wishlist.objects.create(user=request.user, produto=produto)
    
    return redirect('ecommerce:detalhes_produto', id_produto)


# AVALIAÇÃO


@usuario_comum_required
def fazer_avaliacao(request, id_produto):
    if request.method == "POST":
        form_avaliacao = forms.FormAvaliacao(request.POST)

        if form_avaliacao.is_valid():
            produto = get_object_or_404(Produto, id=id_produto)
            avaliacao = form_avaliacao.save(commit=False)
            avaliacao.user = request.user
            avaliacao.produto = produto
            avaliacao.save()

            # Atualizar nota do produto
            produto.nota = Avaliacao.objects.filter(produto=produto).aggregate(Avg('nota'))['nota__avg']
            produto.avaliacoes += 1
            produto.save()

            return redirect('detalhes_produto', id_produto)
    else:
        form_avaliacao = forms.FormAvaliacao()

    return render(request, 'ecommerce/detalhes_produto.html', {
        'form': form_avaliacao
    })   


@usuario_comum_required
def deletar_avaliacao(request, id_produto, id_avaliacao):
    avaliacao = get_object_or_404(Avaliacao, id=id_avaliacao)
    avaliacao.delete()

    # Atualizar nota do produto
    produto = get_object_or_404(Produto, id=id_produto)
    produto.nota = Avaliacao.objects.filter(produto=produto).aggregate(Avg('nota'))['nota__avg']
    produto.avaliacoes -= 1
    produto.save()
    return redirect('detalhes_produto', id_produto)


# CARRINHO

## Preferiu-se fazer o controle de estoque (atualização no db) na finalização da compra e não no carrinho

## Caso exceda em peso/volume o limite máximo permitido para um único veículo, será pensada na criação de uma lógica que permita dois ou mais veículos (se der tempo...)
@usuario_comum_required
def carrinho(request):
    carrinho = Carrinho.objects.filter(user=request.user, is_active=True).first()

    if carrinho:
        itens = ItemCarrinho.objects.filter(carrinho=carrinho)
    else:
        carrinho = Carrinho.objects.create(user=request.user)
        itens = []

    return render(request, 'ecommerce/carrinho.html', {
        'itens': itens,
        'carrinho': carrinho,
        'total': carrinho.total_carrinho()
    })


def acionar_carrinho(request, id_produto):
    produto = get_object_or_404(Produto, id=id_produto)
    carrinho, _ = Carrinho.objects.get_or_create(user=request.user, is_active=True)
    item_carrinho = ItemCarrinho.objects.filter(carrinho=carrinho, produto=produto).first()

    return carrinho, item_carrinho, produto


@usuario_comum_required
def adicionar_ao_carrinho(request, id_produto):
    carrinho, item_carrinho, produto = acionar_carrinho(request, id_produto)

    if item_carrinho:
        # Garante que a quantidade de itens no carrinho seja menor que o estoque 
        if item_carrinho.quantidade < produto.estoque:
            item_carrinho.quantidade += 1
            item_carrinho.save()
        else:
            messages.error(request, "Estoque insuficiente para adicionar mais unidades.", extra_tags=f"{id_produto}") # Aqui tomar cuidado, que o django adiciona automaticamente a tag "error"; ex: se o id fosse '16' a tag seria '16 error'
    else:
        # Verifica se há algum produto no estoque para assim poder criar o item
        if produto.estoque > 0:
            item_carrinho = ItemCarrinho.objects.create(carrinho=carrinho, produto=produto, quantidade=1)
        else:
            messages.error(request, "Produto fora de estoque.", extra_tags=f"{id_produto}")

    # Redireciona para a página onde o usuário estava antes de clicar no botão que aciona o carrinho
    return HttpResponseRedirect(request.META.get('HTTP_REFERER'))


@usuario_comum_required
def remover_do_carrinho(request, id_produto):
    _, item_carrinho, _ = acionar_carrinho(request, id_produto)

    if item_carrinho.quantidade == 1:
        item_carrinho.delete()
    else:
        item_carrinho.quantidade -= 1
        item_carrinho.save()

    return HttpResponseRedirect(request.META.get('HTTP_REFERER'))


@usuario_comum_required
def abandonar_carrinho(request, id_carrinho):
    carrinho = get_object_or_404(Carrinho, id=id_carrinho)
    carrinho.status = "abandonado"
    carrinho.is_active = False
    carrinho.save()
    return redirect('ecommerce:index')


@usuario_comum_required
def finalizar_carrinho(request, id_carrinho):
    carrinho = get_object_or_404(Carrinho, id=id_carrinho)
    carrinho.status = "finalizado"
    carrinho.save()

    return redirect('ecommerce:exibir_enderecos')


# CHECKOUT


# para garantir que só exiba os enderecos só permitir (permission denied) se tiver um carrinho na session com o id do usuario

@usuario_comum_required
def exibir_enderecos(request):
    selecao = SelecaoEnderecoUsuario.objects.filter(user=request.user).prefetch_related('endereco') # o Django faz uma única query com um join, trazendo os dados tanto de SelecaoEnderecoUsuario quanto de Endereco em um único resultado de consulta
    return render(request, 'ecommerce/selecao_enderecos.html', { 
        'selecao': selecao
    })


@usuario_comum_required
def adicionar_endereco(request):
    if request.method == "POST":
        form = forms.EnderecoForm(request.POST)
        
        if form.is_valid():
            try:
                endereco = Endereco.objects.create(**form.cleaned_data) # Para corrigir o problema, você precisa acessar os dados validados do formulário. Em vez de passar **form diretamente, você deve passar form.cleaned_data, que é o dicionário com os dados validados.
                SelecaoEnderecoUsuario.objects.create(user=request.user, endereco=endereco)
            except IntegrityError as e:
                return render(request, 'ecommerce/adicionar_endereco.html', {'error': str(e)})
            
            return redirect('ecommerce:exibir_enderecos')
        
    form = forms.EnderecoForm()
    return render(request, 'ecommerce/adicionar_endereco.html', {'form': form})


@usuario_comum_required
def selecionar_endereco(request, id_endereco):
    request.session['id_endereco'] = id_endereco
    return redirect('ecommerce:confirmar_pedido')


@usuario_comum_required
def confirmar_pedido(request):
    from decimal import Decimal

    carrinho = Carrinho.objects.filter(user=request.user).last()
    if not carrinho:
    # Lidar com o caso de carrinho vazio
        return redirect('ecommerce:carrinho')
    
    endereco = get_object_or_404(Endereco, id=request.session['id_endereco'])
    cupons = Cupom.objects.all()
    
    # Itens do carrinho agrupados por loja
    itens = ItemCarrinho.objects.filter(carrinho=carrinho).select_related('produto__loja')
    itens_por_loja ={
        loja: list(items)
        for loja, items in groupby(itens, key=lambda x: x.produto.loja)
    }

    # Criar ou atualizar o pedido
    pedido, created = Pedido.objects.get_or_create(
        user=request.user, carrinho=carrinho, is_active=True,
        defaults={'endereco_user': endereco, 'total':carrinho.total_carrinho()}
    )
    if not created:
        pedido.total = carrinho.total_carrinho()
        if pedido.cupom:
            pedido.total = pedido.cupom.aplicar_desconto(pedido.total)
        pedido.save()

    # Calcular taxas de entrega dinamicamente (c/ exemplo genérico)
    entregas = []
    for loja, itens in itens_por_loja.items():
        peso_total = sum(item.calcular_peso() for item in itens)
        volume_total = sum(item.calcular_volume() for item in itens)   # depois testar se está considerando a quantidade
        taxa = Decimal("10.00") + Decimal(peso_total) * Decimal("0.50")   # Exemplo genérico
        entrega = {
            "loja": loja,
            "itens": itens,
            "peso": peso_total,
            "volume": volume_total,
            "taxa": round(taxa, 2),
            "forma_de_entrega_form": forms.FormaDeEntregaForm(),
            "entrega_agendada_form": forms.EntregaAgendadaForm(),
        }
        entregas.append(entrega)

    return render(request, 'ecommerce/confirmacao_pedido.html', {
        'pedido': pedido,
        'endereco': endereco,
        'entregas': entregas,
        'cupons': cupons,
        'total': round(pedido.total, 2),
    })
    

@usuario_comum_required
def aplicar_cupom(request):
    id_cupom = request.POST.get('cupom')
    cupom = get_object_or_404(Cupom, id=id_cupom)

    carrinho = Carrinho.objects.filter(user=request.user).last()

    pedido = Pedido.objects.filter(user=request.user, carrinho=carrinho, is_active=True).first()

    # Aplica o cupom:
    pedido.cupom = cupom
    pedido.save()

    return redirect('ecommerce:confirmar_pedido')


@usuario_comum_required
def forma_de_entrega(request):
    if request.method == "POST":
        loja_id = request.POST.get("loja_id")
        loja = get_object_or_404(Loja, id=loja_id)

        forma_form = forms.FormaDeEntregaForm(request.POST)
        agendada_form = forms.EntregaAgendadaForm(request.POST)

        if forma_form.is_valid():
            # Recuperando a entrega associada ao pedido
            pedido = Pedido.objects.filter(user=request.user, is_active=True).last()
            if not pedido:
                return redirect('ecommerce:carrinho')

            entrega, created = Entrega.objects.get_or_create(
                pedido=Pedido.objects.filter(user=request.user, is_active=True).last(),
                endereco_loja =loja.endereco,
                defaults={
                    "peso": 0,
                    "volume": 0,
                    "forma_de_entrega": forma_form.cleaned_data["forma_de_entrega"],
                },
            )

            entrega.forma_de_entrega = forma_form.cleaned_data["forma_de_entrega"]
            entrega.save()

            if entrega.forma_de_entrega == 'agendada' and agendada_form.is_valid():
                agendada = agendada_form.save(commit=False)
                agendada.pedido = pedido
                agendada.endereco_loja = loja.endereco
                agendada.forma_de_entrega = forma_form.cleaned_data["forma_de_entrega"]
                agendada.save()

            return redirect('ecommerce:confirmar_pedido')
    return redirect('ecommerce:confirmar_pedido')


@usuario_comum_required
def entrega_agendada(request):
    if request.method == 'POST':
        form = forms.EntregaAgendadaForm(request.POST)
        if form.is_valid():
            entrega = form.save(commit=True)
            print(entrega.datetime_entrega)
            return redirect("ecommerce:confirmar_pedido")
    form = forms.EntregaAgendadaForm()
    return redirect('ecommerce:confirmar_pedido')