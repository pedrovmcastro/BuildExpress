from django.shortcuts import render, redirect, get_object_or_404
from django.contrib.auth.hashers import make_password
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.decorators import login_required
from django.core.exceptions import PermissionDenied
from django.views import View
from django.db import IntegrityError
from django.db.models import Prefetch
from .forms import LojistaForm, EnderecoForm, ResponsavelForm, LojaForm, PlanoForm, SenhaForm, ProdutoForm, MinhaLojaForm, NewLogoForm, EditLogoForm, RespostaAvaliacaoForm
from .models import Lojista, Plano, RespostaLojista
from ecommerce.models import Endereco, Loja, Produto, Pedido, ItemCarrinho, Avaliacao
from entregas.models import Entrega, EntregaAgendada
from .forms import LojistaLoginForm, LojistaForm
from .decorators import lojista_required


def index(request):
    if request.user.is_authenticated and request.user.is_lojista:
        produtos = Produto.objects.filter(loja__lojista=request.user)
        entregas = Entrega.objects.filter(endereco_loja__loja__lojista=request.user, is_active=True).order_by('-datetime')

        # Calculando o total de cada entrega e buscando os itens do carrinho do pedido
        for entrega in entregas:
            # Acessa a loja relacionada ao endereço da entrega
            loja = entrega.endereco_loja.loja_set.first()

            # Filtra os itens do carrinho que pertencem à loja específica
            itens = entrega.pedido.carrinho.itemcarrinho_set.filter(produto__loja=loja).select_related('produto')

            entrega.total_itens = sum(item.calcular_total() for item in itens)
            entrega.itens = itens

        return render(request, 'empresarial/index.html', {
            'produtos': produtos,
            'entregas': entregas
        })
    return redirect("empresarial:cadastro_inicial")


class LojistaLoginView(View):
    def get(self, request):
        form = LojistaLoginForm()
        return render(request, "empresarial/login.html", {
            "form": form
        })
    
    def post(self, request):
        form = LojistaLoginForm(request.POST)

        if form.is_valid():
            email = form.cleaned_data['email']
            password = form.cleaned_data['password']
            user = authenticate(request, email=email, password=password)

            if user:
                login(request, user)
                return redirect("empresarial:index")
            
        return render(request, "empresarial/login.html", {
            "form": form,
            "error": "Usuário e/ou senha inválidos"
        })


class LojistaLogoutView(View):
    def dispatch(self, request, *args, **kwargs):
        # Verifique se o usuário está autenticado e se é um lojista
        if not request.user.is_authenticated or not request.user.is_lojista:
            raise PermissionDenied  # Retorna erro 403 se não for um lojista
        return super().dispatch(request, *args, **kwargs)

    def get(self, request):
        logout(request)
        return redirect("empresarial:lojista_login")


def cadastro_inicial(request):
    if request.method == "POST":
        form = LojistaForm(request.POST)

        if form.is_valid():
            request.session['lojista_nome'] = form.cleaned_data['nome']
            request.session['lojista_email'] = form.cleaned_data['email']
            request.session['lojista_telefone'] = form.cleaned_data['telefone']

            return redirect('empresarial:cadastrar_endereco')
    
    if request.user.is_authenticated and request.user.is_lojista:
            return redirect('empresarial:index')

    form = LojistaForm()
    return render(request, 'empresarial/cadastro_inicial.html', {'form': form})


def cadastrar_endereco(request):
    if request.method == "POST":
        form = EnderecoForm(request.POST)
        if form.is_valid():
            # Armazena os dados na sessão, sem salvar no banco ainda, apesar de ser um ModelForm
            request.session['loja_cep'] = form.cleaned_data['cep']
            request.session['loja_estado'] = form.cleaned_data['estado']
            request.session['loja_cidade'] = form.cleaned_data['cidade']
            request.session['loja_bairro'] = form.cleaned_data['bairro']
            request.session['loja_logradouro'] = form.cleaned_data['logradouro']
            request.session['loja_numero'] = form.cleaned_data['numero']
            
            return redirect('empresarial:cadastrar_responsavel')
        
    form = EnderecoForm()
    return render(request, 'empresarial/cadastrar_endereco.html', {'form': form})


def cadastrar_responsavel(request):
    if request.method == "POST":
        form = ResponsavelForm(request.POST)
        if form.is_valid():
            request.session['responsavel_nome'] = form.cleaned_data['nome_responsavel']
            request.session['responsavel_cpf'] = form.cleaned_data['cpf_responsavel']

            return redirect('empresarial:cadastrar_loja')
        
    form = ResponsavelForm()
    return render(request, 'empresarial/cadastrar_responsavel.html', {'form': form})


def cadastrar_loja(request):
    if request.method == "POST":
        form = LojaForm(request.POST)
        if form.is_valid():
            request.session['loja_cnpj'] = form.cleaned_data['cnpj']
            request.session['loja_nome'] = form.cleaned_data['nome_loja']
            request.session['loja_telefone'] = form.cleaned_data['telefone_loja']

            return redirect('empresarial:cadastrar_plano')
        
    form = LojaForm()
    return render(request, 'empresarial/cadastrar_loja.html', {'form': form})


def cadastrar_plano(request):
    if request.method == "POST":
        form = PlanoForm(request.POST)
        if form.is_valid():
            request.session['loja_plano'] = form.cleaned_data['plano']
            return redirect('empresarial:cadastrar_senha')
    form = PlanoForm()
    return render(request, 'empresarial/cadastrar_plano.html', {'form': form})


def cadastrar_senha(request):
    if request.method == "POST":
        form = SenhaForm(request.POST)
        if form.is_valid():
            request.session['lojista_senha'] = form.cleaned_data['password']
            return redirect('empresarial:concluir_cadastro')
            
    form = SenhaForm()
    return render(request, 'empresarial/cadastrar_senha.html', {'form': form})


def concluir_cadastro(request):
    if request.method == "POST":
        # Dados do lojista
        lojista_data = {
            'nome': request.POST.get('lojista_nome'),
            'email': request.POST.get('lojista_email'),
            'telefone': request.POST.get('lojista_telefone'),
        }
        senha = request.session.get('lojista_senha')

        # Dados do endereço
        endereco_data = {
            'cep': request.POST.get('loja_cep'),
            'estado': request.POST.get('loja_estado'),
            'cidade': request.POST.get('loja_cidade'),
            'bairro': request.POST.get('loja_bairro'),
            'logradouro': request.POST.get('loja_logradouro'),
            'numero': request.POST.get('loja_numero')
        }

        try:
            # Criação do Lojista
            lojista = Lojista.objects.create_user(password=senha, **lojista_data)
            # Criação do Endereço
            endereco = Endereco.objects.create(**endereco_data)
        except IntegrityError as e:
            return render(request, 'empresarial/cadastro_conclusao.html', {'error': str(e)})
        
        # Obter uma instância de Plano
        plano_nome = request.session.get('loja_plano')
        plano = get_object_or_404(Plano, tipo=plano_nome)
        
        # Dados da loja
        loja_data = {
            'nome': request.POST.get('loja_nome'),
            'cnpj': request.POST.get('loja_cnpj'),
            'telefone': request.POST.get('loja_telefone'),
            'nome_responsavel': request.POST.get('responsavel_nome'),
            'cpf_responsavel': request.POST.get('responsavel_cpf'),
            'plano': plano,
            'endereco': endereco,
            'lojista': lojista
        }

        try:
            # Criação da Loja
            Loja.objects.create(**loja_data)
        except IntegrityError as e:
            return render(request, 'empresarial/cadastro_conclusao.html', {'error': str(e)})   
            
        # Autenticar e logar o usuário
        user = authenticate(request, email=lojista_data['email'], password=senha)
        if user:
            request.session.flush()
            login(request, user)
    
        return redirect('empresarial:index')
    
    return render(request, 'empresarial/cadastro_conclusao.html', {
        **request.session  # Passa todos os dados da sessão para o template
    })


@lojista_required
def pagina_produto(request, id_produto):
    produto = get_object_or_404(Produto, id=id_produto)

    # Avaliações e Respostas
    avaliacoes = Avaliacao.objects.filter(produto=produto).prefetch_related(
        Prefetch('respostas', queryset=RespostaLojista.objects.select_related('lojista'))
    )

    # Responder avaliações
    form_resposta = RespostaAvaliacaoForm()

    if request.user.is_authenticated and produto.loja.lojista == request.user:
        return render(request, 'empresarial/pagina_produto.html', {
            'produto': produto,
            'volume': round(produto.volume_em_metros_cubicos()*1000000, 2),
            'avaliacoes': avaliacoes,
            'form': form_resposta,
        })
    else:
        raise PermissionDenied


@lojista_required
def cadastrar_produto(request):
    if request.method == "POST":
        form = ProdutoForm(request.POST, request.FILES)

        if form.is_valid():
            try:
                produto = form.save(commit=False)
                produto.loja = Loja.objects.filter(lojista=request.user).first()
                produto.save()
            except IntegrityError as e:
                return render(request, 'empresarial/cadastrar_produto.html', {'error': str(e)})

            return redirect('empresarial:pagina_produto', id_produto=produto.id)

    form = ProdutoForm()
    return render(request, 'empresarial/cadastrar_produto.html', {'form': form})


@lojista_required
def editar_produto(request, id_produto):
    produto = get_object_or_404(Produto, id=id_produto)
    
    if request.user.is_authenticated and produto.loja.lojista == request.user:
        if request.method == 'POST':
            form = ProdutoForm(request.POST, request.FILES, instance=produto)
            if form.is_valid():
                form.save()
                return redirect("empresarial:pagina_produto", id_produto=produto.id)

        form = ProdutoForm(instance=produto)
        
        return render(request, 'empresarial/editar_produto.html', {
            'form': form
        })
    else:
        raise PermissionDenied


@lojista_required
def deletar_produto(request, id_produto):
    produto = get_object_or_404(Produto, id=id_produto)

    if request.user.is_authenticated and produto.loja.lojista == request.user:
        produto.delete()
        return redirect("empresarial:index")
    else:
        raise PermissionDenied


@lojista_required
def configurar_loja(request):
    loja = get_object_or_404(Loja, lojista=request.user)

    initial_data = {
        'nome_loja': loja.nome,
        'telefone_loja': loja.telefone,
        'pedido_minimo': loja.pedido_minimo
    }

    if request.method == 'POST':
        form = MinhaLojaForm(request.POST)
        new_logo_form = NewLogoForm(request.POST, request.FILES, instance=loja)
        edit_logo_form = EditLogoForm(request.POST, request.FILES, instance=loja)

        if form.is_valid():
            loja.nome = form.cleaned_data['nome_loja']
            loja.telefone = form.cleaned_data['telefone_loja']
            loja.pedido_minimo = form.cleaned_data['pedido_minimo']
            loja.save()
        
        if new_logo_form.is_valid():
            new_logo_form.save()

        if edit_logo_form.is_valid():
            edit_logo_form.save()

        return redirect('empresarial:loja')

    form = MinhaLojaForm(initial=initial_data)
    new_logo_form = NewLogoForm(instance=loja)
    edit_logo_form = EditLogoForm(instance=loja)
    
    return render(request, 'empresarial/perfil_loja.html', {
        'form': form,
        'new_logo_form': new_logo_form,
        'edit_logo_form': edit_logo_form,
        'loja': loja
    })


@lojista_required
def preparar_pedido(request, id_entrega):
    entrega = get_object_or_404(Entrega, id=id_entrega)

    # Verifica se o lojista autenticado é o responsável pela loja associada ao endereço da entrega
    loja = Loja.objects.filter(endereco=entrega.endereco_loja).first()
    if loja and loja.lojista == request.user:
        entrega.status = 'preparando o pedido'
        entrega.save()
        return redirect("empresarial:index")

    # Se a validação falhar, lança uma exceção de permissão negada
    raise PermissionDenied


@lojista_required
def acionar_entrega(request, id_entrega):
    entrega = get_object_or_404(Entrega, id=id_entrega)

    loja = Loja.objects.filter(endereco=entrega.endereco_loja).first()
    if loja and loja.lojista == request.user:
        entrega.status = 'pedido preparado'
        entrega.save()
        return redirect("empresarial:index")
    
    raise PermissionDenied


@lojista_required
def saiu_para_entrega(request, id_entrega):
    entrega = get_object_or_404(Entrega, id=id_entrega)

    loja = Loja.objects.filter(endereco=entrega.endereco_loja).first()
    if loja and loja.lojista == request.user:
        entrega.status = 'saiu para entrega'
        entrega.save()
        return redirect("empresarial:index")
    
    raise PermissionDenied


@lojista_required
def responder_avaliacao(request, id_avaliacao):
    avaliacao = get_object_or_404(Avaliacao, id=id_avaliacao)
        
    if request.method == 'POST':
        form = RespostaAvaliacaoForm(request.POST)

        if form.is_valid():
            resposta = form.save(commit=False)
            resposta.lojista = request.user
            resposta.avaliacao = avaliacao
            resposta.save()

    return redirect("empresarial:pagina_produto", id_produto=avaliacao.produto.id)
