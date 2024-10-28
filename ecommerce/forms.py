from django import forms

from . models import Avaliacao

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