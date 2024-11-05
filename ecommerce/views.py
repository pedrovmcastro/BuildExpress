from django.shortcuts import render, redirect, get_object_or_404
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.decorators import login_required
from django.http import HttpResponseRedirect
from django.db import IntegrityError
from django.db.models import Avg
from django.urls import reverse
from django.views import View

from .models import Produto, UsuarioComum, Loja, Categoria, Wishlist, Avaliacao
from . import forms
from .decorators import usuario_comum_required


def index(request):
    return render(request, "ecommerce/index.html", {
        "produtos": Produto.objects.all()
    })


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


@usuario_comum_required
class UsuarioComumLogoutView(View):
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


@usuario_comum_required
def wishlist(request):
    produtos = Produto.objects.filter(wishlist__user=request.user)
    return render(request, 'ecommerce/lista_de_desejos.html', {
        'wishlist': produtos
    })


@usuario_comum_required
def acionar_wishlist(request, id_produto):
    produto = get_object_or_404(Produto, id=id_produto)
    wishlist_item = Wishlist.objects.filter(user=request.user, produto=produto).first()

    if wishlist_item:
        wishlist_item.delete()
    else:
        Wishlist.objects.create(user=request.user, produto=produto)
    
    return redirect('detalhes_produto', id_produto)


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

