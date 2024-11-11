from django import forms
from ecommerce.models import Endereco, Produto, Categoria, Loja
import re


class BaseLoginForm(forms.Form):
    """
    Este formulário requer que o usuário forneça um endereço de email e uma senha.
    A validação é realizada para garantir que ambos os campos sejam preenchidos.
    """
    email = forms.EmailField(
        required=True,
        widget=forms.EmailInput(attrs={
            'class': 'form-control',
            'placeholder': 'joao@email.com'
        })
    )
    password = forms.CharField(
        required=True,
        widget=forms.PasswordInput(attrs={
            'class': 'form-control',
            'placeholder': 'Senha'
        })
    )

    def clean(self):
        cleaned_data = super().clean()
        email = cleaned_data.get("email")
        password = cleaned_data.get("password")

        if not email or not password:
            raise forms.ValidationError("Por favor, preencha todos os campos.")

        return cleaned_data

class LojistaLoginForm(BaseLoginForm):
    pass


class LojistaForm(forms.Form):
    nome = forms.CharField(
        max_length=100,
        label="Nome completo",
        widget=forms.TextInput(attrs={'placeholder': 'João da Silva', 'class': 'form-control'})
    )
    email = forms.EmailField(
        label="E-mail",
        widget=forms.EmailInput(attrs={'placeholder': 'email@email.com.br', 'class': 'form-control'})
    )
    telefone = forms.CharField(
        max_length=15,
        label="Celular (com DDD)",
        widget=forms.TextInput(attrs={'placeholder': '(00) 00000-0000', 'class': 'form-control'})
        )


class EnderecoForm(forms.ModelForm):
    class Meta:
        model = Endereco
        fields = ['cep', 'estado', 'cidade', 'bairro', 'logradouro', 'numero']
        widgets = {
            'cep': forms.TextInput(attrs={
                'class': 'form-control',
                'placeholder': '00000-000'
            }),
            'estado': forms.TextInput(attrs={
                'class': 'form-control',
                'placeholder': 'UF'
            }),
            'cidade': forms.TextInput(attrs={
                'class': 'form-control',
                'placeholder': 'Cidade do seu negócio'
            }),
            'bairro': forms.TextInput(attrs={
                'class': 'form-control',
                'placeholder': 'Exemplo: Centro'
            }),
            'logradouro': forms.TextInput(attrs={
                'class': 'form-control',
                'placeholder': 'Exemplo: Av. Amazonas'
            }),
            'numero': forms.NumberInput(attrs={
                'class': 'form-control',
                'placeholder': 'Número da casa ou prédio'
            }),
        }


class ResponsavelForm(forms.Form):
    nome_responsavel = forms.CharField(
        label="Nome completo",
        max_length=100,
        widget=forms.TextInput(attrs={
            'class': 'form-control',
            'placeholder': 'Nome do responsável legal'
        })
    )
    
    cpf_responsavel = forms.CharField(
        label="CPF",
        max_length=14,  # Inclui pontos e traço no formato 000.000.000-00
        widget=forms.TextInput(attrs={
            'class': 'form-control',
            'placeholder': '000.000.000-00'
        })
    )


class LojaForm(forms.Form):
    cnpj = forms.CharField(
        label="CNPJ",
        max_length=18,  # Definindo o tamanho máximo para seguir o formato xx.xxx.xxx/xxxx-xx
        widget=forms.TextInput(
            attrs={
                'class': 'form-control',
                'placeholder': '00.000.000/0000-00'
            }
        )
    )
    nome_loja = forms.CharField(
        label="Nome da loja (como aparecerá no app)",
        max_length=100,
        widget=forms.TextInput(
            attrs={
                'class': 'form-control',
                'placeholder': 'Nome do seu negócio'
            }
        )
    )
    telefone_loja = forms.CharField(
        label="Telefone ou celular da loja (como aparecerá no app)",
        max_length=15,  # Definindo o tamanho para seguir o formato (XX) XXXXX-XXXX
        widget=forms.TextInput(
            attrs={
                'class': 'form-control',
                'placeholder': '(00) 00000-0000'
            }
        )
    )


class PlanoForm(forms.Form):
    PLANO_CHOICES = [
        ('basico', 'Básico'),
        ('entrega', 'Entrega'),
    ]
    
    plano = forms.ChoiceField(
        choices=PLANO_CHOICES,
        widget=forms.RadioSelect(attrs={'class': 'plano-option'}),
        label="Escolha seu plano",
        required=True
    )


class SenhaForm(forms.Form):
    password = forms.CharField(
        label='Senha',
        widget=forms.PasswordInput(attrs={
            'class': 'form-control',
            'placeholder': 'Digite uma nova senha',
        }),
        min_length=10,  # Mínimo de 10 caracteres
    )
    confirmation = forms.CharField(
        label='Confirmar senha',
        widget=forms.PasswordInput(attrs={
            'class': 'form-control',
            'placeholder': 'Digite novamente a nova senha',
        }),
    )
    
    def clean(self):
        cleaned_data = super().clean()
        password = cleaned_data.get('password')
        confirmation = cleaned_data.get('confirmation')

        # Verificações de segurança da senha
        if password:
            if not re.search(r'[A-Z]', password):  # Verifica letra maiúscula
                raise forms.ValidationError("A senha deve conter pelo menos uma letra maiúscula.")
            if not re.search(r'[a-z]', password):  # Verifica letra minúscula
                raise forms.ValidationError("A senha deve conter pelo menos uma letra minúscula.")
            if not re.search(r'[0-9]', password):  # Verifica número
                raise forms.ValidationError("A senha deve conter pelo menos um número.")
            if not re.search(r'[!@#$%^&*(),.?":{}|<>]', password):  # Verifica símbolo
                raise forms.ValidationError("A senha deve conter pelo menos um símbolo (!, @, #, $, %, *).")

        if password and confirmation and password != confirmation:
            raise forms.ValidationError("As senhas não correspondem.")
        
        return cleaned_data
    

class CadastroForm(forms.Form):
    lojista = LojistaForm()
    endereco = EnderecoForm()
    responsavel = ResponsavelForm()
    loja = LojaForm()
    plano = PlanoForm()
    
    def is_valid(self):
        # Chamando o método is_valid() de cada formulário individual
        valid = super().is_valid()  # Validação básica de CadastroForm
        for form in [self.fields['lojista'], self.fields['endereco'], self.fields['responsavel'], 
                     self.fields['loja'], self.fields['plano'], self.fields['senha']]:
            if not form.is_valid():
                valid = False
        return valid
    
    def save(self, session):
        # Salvando dados de cada formulário individual na sessão
        session['lojista'] = self.cleaned_data['lojista']
        session['endereco'] = self.cleaned_data['endereco']
        session['responsavel'] = self.cleaned_data['responsavel']
        session['loja'] = self.cleaned_data['loja']
        session['plano'] = self.cleaned_data['plano']


class ProdutoForm(forms.ModelForm):
    class Meta:
        model = Produto
        fields = ['nome', 'descricao', 'preco', 'peso', 'comprimento', 'largura', 'altura', 'photo', 'categoria', 'estoque']

        labels = {
            'nome': 'Nome',
            'descricao': 'Descrição',
            'preco': 'Preço',
            'peso': 'Peso',
            'comprimento': 'Comprimento',
            'largura': 'Largura',
            'altura': 'Altura',
            'photo': 'Imagem',
            'categoria': 'Categoria',
            'estoque': 'Estoque',
        }

        widgets = {
            'nome': forms.TextInput(attrs={
                'class': 'form-control',
                'placeholder': 'Nome do Produto'
            }),
            'descricao': forms.Textarea(attrs={
                'class': 'form-control',
                'placeholder': 'Descreva em algumas linhas o seu produto',
                'rows': 4,  # Define o número de linhas visíveis
                'style': 'resize: none;' # Impede o redimensionamento
            }),
            'preco': forms.NumberInput(attrs={
                'class': 'form-control',
                'placeholder': 'Preço em R$'
            }),
            'peso': forms.NumberInput(attrs={
                'class': 'form-control',
                'placeholder': 'Peso em Kg'
            }),
            'comprimento': forms.NumberInput(attrs={
                'class': 'form-control',
                'placeholder': 'Comprimento em cm'
            }),
            'largura': forms.NumberInput(attrs={
                'class': 'form-control',
                'placeholder': 'Largura em cm'
            }),
            'altura': forms.NumberInput(attrs={
                'class': 'form-control',
                'placeholder': 'Altura em cm'
            }),
            'photo': forms.ClearableFileInput(attrs={
                'class': 'form-control',
            }),
            'categoria': forms.Select(attrs={
                'class': 'form-control',
                'placeholder': 'Categoria do produto'
            }),
            'estoque': forms.NumberInput(attrs={
                'class': 'form-control',
                'placeholder': 'Quantidade em estoque'
            })
        }


class MinhaLojaForm(forms.Form):
    nome_loja = forms.CharField(
        label="Nome da loja (como aparecerá no app)",
        max_length=100,
        widget=forms.TextInput(
            attrs={
                'class': 'form-control',
                'placeholder': 'Nome do seu negócio'
            }
        )
    )
    telefone_loja = forms.CharField(
        label="Telefone ou celular da loja (como aparecerá no app)",
        max_length=15,  # Definindo o tamanho para seguir o formato (XX) XXXXX-XXXX
        widget=forms.TextInput(
            attrs={
                'class': 'form-control',
                'placeholder': '(00) 00000-0000'
            }
        )
    )
    pedido_minimo = forms.DecimalField(
        label="Pedido mínimo",
        max_digits=10,
        decimal_places=2,
        widget=forms.TextInput(
            attrs={
                'class': 'form-control',
                'placeholder': 'Ex: 50.00'
            }
        )
    )


class NewLogoForm(forms.ModelForm):
    class Meta:
        model = Loja
        fields = ['logo']
        widgets = {
            'logo': forms.FileInput(attrs={'id': 'id_logo'})  # Define o ID explicitamente
        }


class EditLogoForm(forms.ModelForm):
    class Meta:
        model = Loja
        fields = ['logo']
        widgets = {
            'logo': forms.FileInput(attrs={'id': 'ed-logo'})
        }