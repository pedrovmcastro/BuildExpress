from django.contrib import admin

from . import models

admin.site.register(models.UsuarioComum)
admin.site.register(models.Endereco)
admin.site.register(models.Loja)
admin.site.register(models.Categoria)
admin.site.register(models.Produto)
