from django.shortcuts import render

from .models import Produto


def index(request):
    return render(request, "ecommerce/index.html", {
        "produtos": Produto.objects.all()
    })
