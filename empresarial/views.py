from django.shortcuts import render, redirect, get_object_or_404
from django.contrib.auth.hashers import make_password
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.decorators import login_required
from django.db import IntegrityError
from .forms import LojistaForm, EnderecoForm, ResponsavelForm, LojaForm, PlanoForm, SenhaForm, CadastroForm
from .models import Lojista, Plano
from ecommerce.models import Endereco, Loja
from django.views import View
from .forms import LojistaLoginForm, LojistaForm


def index(request):
    return render(request, 'empresarial/index.html')


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
    def post(self, request):
        logout(request)
        return redirect("empresarial:login")


def cadastro_inicial(request):
    if request.method == "POST":
        form = LojistaForm(request.POST)

        if form.is_valid():
            request.session['lojista_nome'] = form.cleaned_data['nome']
            request.session['lojista_email'] = form.cleaned_data['email']
            request.session['lojista_telefone'] = form.cleaned_data['telefone']

            return redirect('empresarial:cadastrar_endereco')

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
            'nome': request.session.get('lojista_nome'),
            'email': request.session.get('lojista_email'),
            'telefone': request.session.get('lojista_telefone'),
            'password': make_password(request.session.get('lojista_senha'))  # Aqui você deve hashear a senha
        }

        # Dados do endereço
        endereco_data = {
            'cep': request.session.get('loja_cep'),
            'estado': request.session.get('loja_estado'),
            'cidade': request.session.get('loja_cidade'),
            'bairro': request.session.get('loja_bairro'),
            'logradouro': request.session.get('loja_logradouro'),
            'numero': request.session.get('loja_numero')
        }

        try:
            # Criação do Lojista
            lojista = Lojista.objects.create(**lojista_data)
            # Criação do Endereço
            endereco = Endereco.objects.create(**endereco_data)
        except IntegrityError as e:
            return render(request, 'empresarial/cadastro_conclusao.html', {'error': str(e)})
        
        # Obter uma instância de Plano
        plano_nome = request.session.get('loja_plano')
        plano = get_object_or_404(Plano, tipo=plano_nome)
        
        # Dados da loja
        loja_data = {
            'nome': request.session.get('loja_nome'),
            'cnpj': request.session.get('loja_cnpj'),
            'telefone': request.session.get('loja_telefone'),
            'nome_responsavel': request.session.get('responsavel_nome'),
            'cpf_responsavel': request.session.get('responsavel_cpf'),
            'plano': plano,
            'endereco': endereco,
            'lojista': lojista
        }

        try:
            # Criação da Loja
            Loja.objects.create(**loja_data)
        except IntegrityError as e:
            return render(request, 'empresarial/cadastro_conclusao.html', {'error': str(e)})   
            
        # Limpar a sessão após o cadastro
        request.session.flush()

        return redirect('empresarial:index')
    
    return render(request, 'empresarial/cadastro_conclusao.html', {
        **request.session  # Passa todos os dados da sessão para o template
    })


def editar_cadastro(request):
    if request.method == 'POST':
        form = CadastroForm(request.POST)
        if form.is_valid():
            form.save(request.session)
            return redirect('empresarial:cadastro_conclusao')
    else:
        # Configurando o formulário com valores iniciais da sessão
        form = CadastroForm(initial={
            'lojista': request.session.get('lojista'),
            'endereco': request.session.get('endereco'),
            'responsavel': request.session.get('responsavel'),
            'loja': request.session.get('loja'),
            'plano': request.session.get('plano'),
        })

    return render(request, 'empresarial/cadastro_editar.html', {'form': form})

