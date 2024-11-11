from celery import shared_task
from django.utils import timezone
from .models import Carrinho
from datetime import timedelta

@shared_task
def verificar_carrinhos_abandonados():
    limite_tempo = timezone.now() - timedelta(hours=24)
    carrinhos_abandonados = Carrinho.objects.filter(datetime__lte=limite_tempo, is_active=True)

    for carrinho in carrinhos_abandonados:
        carrinho.status = "abandonado"
        carrinho.is_active = False
        carrinho.save()