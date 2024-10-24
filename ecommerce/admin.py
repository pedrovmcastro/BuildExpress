from django.contrib import admin

from . import models

# Register your models here.
admin.site.register(models.Endereco)
admin.site.register(models.Loja)
admin.site.register(models.Produto)