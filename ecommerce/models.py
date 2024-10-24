import os
from django.db import models
from django.core.validators import RegexValidator

from . import utils

class Endereco(models.Model):
    logradouro = models.CharField(max_length=100)
    numero = models.IntegerField()
    bairro = models.CharField(max_length=100)
    cidade = models.CharField(max_length=50)
    cep = models.CharField(max_length=10)


class Loja(models.Model):
    nome = models.CharField(max_length=100)
    cnpj = models.CharField(
        max_length=14,
        unique=True,
        validators=[RegexValidator(regex=r'^\d{14}$', message='CNPJ inválido')]
    )
    ie = models.CharField(
        max_length=14,
        unique=True,
        validators=[RegexValidator(regex=r'^\d{9}$', message='IE inválida')]
    )
    nota = models.DecimalField(max_digits=3, decimal_places=2)
    id_endereco = models.ForeignKey(Endereco, on_delete=models.CASCADE)
    logo = models.ImageField(upload_to='logos/', null=True, blank=True)


class Produto(models.Model):
    nome = models.CharField(max_length=100)
    descricao = models.TextField()
    preco = models.DecimalField(max_digits=10, decimal_places=2)
    peso = models.DecimalField(max_digits=10, decimal_places=2)
    id_loja = models.ForeignKey(Loja, on_delete=models.CASCADE)
    photo = models.ImageField(upload_to='produtos/', null=True, blank=True)

