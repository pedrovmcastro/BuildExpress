from django.shortcuts import render, redirect, get_object_or_404
from django.contrib.auth.hashers import make_password
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.decorators import login_required
from django.core.exceptions import PermissionDenied
from django.views import View
from django.db import IntegrityError
from .forms import LojistaForm, EnderecoForm, ResponsavelForm, LojaForm, PlanoForm, SenhaForm, CadastroForm, ProdutoForm
from .models import Lojista, Plano
from ecommerce.models import Endereco, Loja, Produto, RenamableImageModel
from .forms import LojistaLoginForm, LojistaForm


def index(request):
    produtos = Produto.objects.filter(loja__lojista=request.user)
    return render(request, 'empresarial/index.html', {
        'produtos': produtos
    })


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
            'password': make_password(request.session.get('lojista_senha'))  # Aqui você deve hashear a senha
        }

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
            
        # Limpar a sessão após o cadastro
        request.session.flush()

        return redirect('empresarial:index')
    
    return render(request, 'empresarial/cadastro_conclusao.html', {
        **request.session  # Passa todos os dados da sessão para o template
    })


def pagina_produto(request, id_produto):
    produto = get_object_or_404(Produto, id=id_produto)

    if request.user.is_authenticated and produto.loja.lojista == request.user:
        return render(request, 'empresarial/pagina_produto.html', {
            'produto': produto
        })
    else:
        raise PermissionDenied


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


def deletar_produto(request, id_produto):
    produto = get_object_or_404(Produto, id=id_produto)

    if request.user.is_authenticated and produto.loja.lojista == request.user:
        produto.delete()
        return redirect("empresarial:index")
    else:
        raise PermissionDenied
    