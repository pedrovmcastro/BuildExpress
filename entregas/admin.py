from django.contrib import admin
from . import models

admin.site.register(models.Motorista)
admin.site.register(models.Entrega)
admin.site.register(models.EntregaAgendada)

