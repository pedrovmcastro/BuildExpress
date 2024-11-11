from __future__ import absolute_import, unicode_literals

# Esse é o ponto de entrada para o Celery
from .celery import app as celery_app

__all__ = ('celery_app',)