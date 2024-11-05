from django.db import models
from django.contrib.auth.models import BaseUserManager, AbstractBaseUser


class LojistaManager(BaseUserManager):

    def create_user(self, email, password=None, **extra_fields):
        if not email:
            raise ValueError("O email é obrigatório")
        email = self.normalize_email(email)
        extra_fields.setdefault('is_active', True)
        user = self.model(email=email, **extra_fields)
        user.set_password(password)
        user.save()
        return user


class Lojista(AbstractBaseUser):
    email = models.EmailField(unique=True)
    nome = models.CharField(max_length=200)
    telefone = models.CharField(max_length=20, unique=True)
    is_active = models.BooleanField(default=True)
    is_staff = models.BooleanField(default=False)  # Para permitir acesso ao admin
    is_superuser = models.BooleanField(default=False)  # Para permitir permissões de superusuário

    USERNAME_FIELD = 'email'

    objects = LojistaManager()

    def has_perm(self, perm, obj=None):
        return self.is_superuser
    
    def has_module_perms(self, app_label):
        return self.is_superuser

    def __str__(self):
        return self.email
    
    @property
    def is_lojista(self):
        return True
    

class Plano(models.Model):
    TIPO_CHOICES = [
        ('Basico', 'Plano Básico'),
        ('Entrega', 'Plano Entrega'),
    ]

    tipo = models.CharField(max_length=10, choices=TIPO_CHOICES)
    comissao = models.DecimalField(max_digits=5, decimal_places=3)
    mensalidade = models.DecimalField(max_digits=10, decimal_places=2)
    taxa_pagamento_pelo_app = models.DecimalField(max_digits=10, decimal_places=3)

    def __str__(self):
        return self.tipo

    
