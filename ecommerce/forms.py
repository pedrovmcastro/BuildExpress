from django import forms

from . models import Avaliacao


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

        