from django.shortcuts import render
from django.contrib.auth import authenticate, login, logout
from django.http import HttpResponseRedirect
from django.db import IntegrityError
from django.urls import reverse

from .models import Produto, User


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
    
    