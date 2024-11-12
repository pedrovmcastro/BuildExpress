from django import forms

from . models import Avaliacao, Endereco


class BaseLoginForm(forms.Form):
    """
    Este formulário requer que o usuário forneça um endereço de email e uma senha.
    A validação é realizada para garantir que ambos os campos sejam preenchidos.
    """
    email = forms.EmailField(required=True)
    password = forms.CharField(widget=forms.PasswordInput, required=True)

    def clean(self):
        cleaned_data = super().clean()
        email = cleaned_data.get("email")
        password = cleaned_data.get("password")

        if not email or not password:
            raise forms.ValidationError("Por favor, preencha todos os campos.")

        return cleaned_data
    

class UsuarioComumLoginForm(BaseLoginForm):
    pass


class FormAvaliacao(forms.ModelForm):
    class Meta:
        model = Avaliacao
        fields = ['titulo', 'conteudo', 'nota', 'recomenda']
        widgets = {
            'conteudo': forms.Textarea(attrs={'placeholder': 'Adicione sua avaliação', 'rows': 3})
        }
        labels = {
            'conteudo': '',
        }


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
