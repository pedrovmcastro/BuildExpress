from django.db import models
from django.contrib.auth.models import AbstractBaseUser, BaseUserManager
from django.core.validators import MinValueValidator, MaxValueValidator


class MotoristaManager(BaseUserManager):

    def create_user(self, email, password=None, **extra_fields):
        if not email:
            raise ValueError("O email é obrigatório")
        email = self.normalize_email(email)
        extra_fields.setdefault('is_active', True)
        user = self.model(email=email, **extra_fields)
        user.set_password(password)
        user.save()
        return user


class Motorista(AbstractBaseUser):
    email = models.EmailField(unique=True)
    nome = models.CharField(max_length=200)
    telefone = models.CharField(max_length=20, unique=True)
    cpf = models.CharField(max_length=15, unique=True)
    cnh = models.CharField(max_length=15, unique=True)
    nota = models.FloatField(default=None, null=True, blank=True, validators=[MinValueValidator(0), MaxValueValidator(5)])
    is_active = models.BooleanField(default=True)

    USERNAME_FIELD = 'email'

    objects = MotoristaManager()

    def __str__(self):
        return self.email


