from django import forms
from .models import Motorista

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
    

class MotoristaLoginForm(BaseLoginForm):
    pass 


class MotoristaRegisterForm(forms.ModelForm):
    password = forms.CharField(label="Senha", widget=forms.PasswordInput)
    password_confirm = forms.CharField(label="Confirmação de Senha", widget=forms.PasswordInput)

    class Meta:
        model = Motorista
        fields = ['email', 'nome', 'telefone', 'cpf', 'cnh']
        widgets = {
            'email': forms.EmailInput(attrs={
                'class': 'form-control',
                'placeholder': 'email@email.com'
            }),
            'nome': forms.TextInput(attrs={
                'class': 'form-control',
                'placeholder': 'Felipe Oliveira da Silva'
            }),
            'telefone': forms.TextInput(attrs={
                'class': 'form-control',
                'placeholder': '(00) 00000-0000'
            }),
            'cpf': forms.TextInput(attrs={
                'class': 'form-control',
                'placeholder': '000.000.000-00'
            }),
            'cnh': forms.TextInput(attrs={
                'class': 'form-control',
                'placeholder': '00000000000'
            }),
        }
        labels = {
            'email': 'Email',
            'nome': 'Nome Completo',
            'telefone': 'Telefone',
            'cpf': 'CPF',
            'cnh': 'CNH'
        }

    def clean_password_confirm(self):
        password = self.cleaned_data.get("password")
        password_confirm = self.cleaned_data.get("password_confirm")
        if password and password_confirm and password != password_confirm:
            raise forms.ValidationError("As senhas não coincidem.")
        return password_confirm
    
    def save(self, commit=True):
        user = super().save(commit=False)
        user.set_password(self.cleaned_data["password"])
        if commit:
            user.save()
        return user
    