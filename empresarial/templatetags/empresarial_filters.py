from django import template
from django.shortcuts import get_object_or_404
from decimal import Decimal

from ecommerce.models import Avaliacao
from empresarial.models import RespostaLojista

register = template.Library()


@register.filter
def mul(value, arg):
    return value * arg


@register.filter
def to_range_D(init, end):
    """Cria uma lista com intervalo baseado no número fornecido em ordem descrescente"""
    return range(init, end, -1)


@register.filter
def ja_respondeu(id_avaliacao):
    """Verifica se já existe uma resposta associada à avaliação pelo ID"""
    return RespostaLojista.objects.filter(avaliacao_id=id_avaliacao).exists()