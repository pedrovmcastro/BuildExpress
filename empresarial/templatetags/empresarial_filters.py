from django import template
from decimal import Decimal

register = template.Library()


@register.filter
def mul(value, arg):
    return value * arg

@register.filter
def to_range_D(init, end):
    """Cria uma lista com intervalo baseado no número fornecido em ordem descrescente"""
    return range(init, end, -1)