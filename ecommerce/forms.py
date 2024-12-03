from django import forms

from datetime import datetime

from . models import Avaliacao, Endereco, Pedido
from entregas.models import Entrega, EntregaAgendada


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
        fields = ['titulo', 'conteudo', 'recomenda']
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


class FormaDeEntregaForm(forms.ModelForm):
    FORMA_DE_ENTREGA_CHOICES = [
        ('expressa', 'Entrega Expressa'),
        ('agendada', 'Entrega Agendada'),
    ]

    forma_de_entrega = forms.ChoiceField(
        choices=FORMA_DE_ENTREGA_CHOICES,
        widget=forms.Select(attrs={
            'class': 'form-control'
        })
    )

    class Meta:
        model = Entrega
        fields = ['forma_de_entrega']


class EntregaAgendadaForm(forms.ModelForm):
    data = forms.DateField(widget=forms.DateInput(attrs={'type': 'date'}))
    hora = forms.TimeField(widget=forms.TimeInput(attrs={'type':'time'}))

    class Meta:
        model = EntregaAgendada
        fields = ['data', 'hora']
        
    def save(self, commit=True):
        instance = super().save(commit=False)
        # Combine os valores do form para criar o datetime
        instance.datetime_entrega = datetime.combine(self.cleaned_data['data'], self.cleaned_data['hora'])

        if commit:
            instance.save()
        return instance
