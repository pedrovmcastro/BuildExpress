from django.shortcuts import render, redirect, get_object_or_404
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.decorators import login_required
from django.http import HttpResponseRedirect
from django.db import IntegrityError
from django.db.models import Avg
from django.urls import reverse

from .models import Produto, User, Loja, Categoria, Wishlist, Avaliacao
from . import forms


def index(request):
    return render(request, "ecommerce/index.html", {
        "produtos": Produto.objects.all()
    })


def login_view(request):
    if request.method == "POST":

        # Tentativa do usuário logar
        username = request.POST["username"]
        password = request.POST["password"]
        user = authenticate(request, username=username, password=password)

        # Checar se a autenticação foi bem sucedida
        if user is not None:
            login(request, user)
            return HttpResponseRedirect(reverse("index"))
        else:
            return render(request, "ecommerce/login.html", {
                "message": "Usuário e/ou senha inválidos"
            })    
    else:
        return render(request, "ecommerce/login.html")

@login_required
def logout_view(request):
    logout(request)
    return HttpResponseRedirect(reverse("index"))


def register(request):
    if request.method == "POST":
        username = request.POST["username"]
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
        
        # Checar se o username já existe
        if User.objects.filter(username=username).exists():
            return render(request, "ecommerce/register.html", {
                "message": "Nome de usuário já existe."
            })
        
        # Checar se o email já existe
        if User.objects.filter(email=email).exists():
            return render(request, "ecommerce/register.html", {
                "message": "E-mail já cadastrado."
            })
        
        # Checar se o CPF já existe
        if User.objects.filter(cpf=cpf).exists():
            return render(request, "ecommerce/register.html", {
                "message": "CPF já cadastrado."
            })
        
        # Checar se o telefone já existe
        if User.objects.filter(telefone=telefone).exists():
            return render(request, "ecommerce/register.html", {
                "message": "Telefone já cadastrado."
            })

        # Tentativa de cadastrar novo usuário
        try:
            user = User.objects.create_user(
                username=username,
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
        login(request, user)
        return HttpResponseRedirect(reverse("index"))
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

    # Lógica da Wishlist e Fazer Avaliacoes
    if request.user.is_authenticated:
        in_wishlist = Wishlist.objects.filter(user=request.user, produto=produto).exists()
        form_avaliacao = forms.FormAvaliacao()
    else:
        in_wishlist = False
        form_avaliacao = None

    # Avaliacoes
    avaliacoes = Avaliacao.objects.filter(produto=produto)

    return render(request, 'ecommerce/detalhes_produto.html', {
        'produto': produto,
        'in_wishlist': in_wishlist,
        'avaliacoes': avaliacoes,
        'form': form_avaliacao
    })


@login_required
def wishlist(request):
    produtos = Produto.objects.filter(wishlist__user=request.user)
    return render(request, 'ecommerce/lista_de_desejos.html', {
        'wishlist': produtos
    })


@login_required
def acionar_wishlist(request, id_produto):
    produto = get_object_or_404(Produto, id=id_produto)
    wishlist_item = Wishlist.objects.filter(user=request.user, produto=produto).first()

    if wishlist_item:
        wishlist_item.delete()
    else:
        Wishlist.objects.create(user=request.user, produto=produto)
    
    return redirect('detalhes_produto', id_produto)


@login_required
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
            produto.save()

            return redirect('detalhes_produto', id_produto)
    else:
        form_avaliacao = forms.FormAvaliacao()

    return render(request, 'ecommerce/detalhes_produto.html', {
        'form': form_avaliacao
    })   


@login_required
def deletar_avaliacao(request, id_produto, id_avaliacao):
    avaliacao = get_object_or_404(Avaliacao, id=id_avaliacao)
    avaliacao.delete()
    return redirect('detalhes_produto', id_produto)

