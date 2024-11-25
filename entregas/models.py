from django.db import models
from django.contrib.auth.models import AbstractBaseUser, BaseUserManager
from django.core.validators import MinValueValidator, MaxValueValidator

from ecommerce.models import Endereco, Pedido

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
    is_staff = models.BooleanField(default=False)  # Para permitir acesso ao admin
    is_superuser = models.BooleanField(default=False)  # Para permitir permissões de superusuário

    USERNAME_FIELD = 'email'

    objects = MotoristaManager()

    def has_perm(self, perm, obj=None):
        return self.is_superuser
    
    def has_module_perms(self, app_label):
        return self.is_superuser

    def __str__(self):
        return self.email
    
    @property
    def is_lojista(self):
        return False
    
    @property
    def is_motorista(self):
        return True


class Entrega(models.Model):
    pedido = models.ForeignKey(Pedido, on_delete=models.CASCADE)    # Atualizada na view ecommerce:forma_de_entrega
    endereco_loja = models.ForeignKey(Endereco, on_delete=models.CASCADE)   # Atualizada na view ecommerce:forma_de_entrega
    motorista = models.ForeignKey(Motorista, on_delete=models.SET_NULL, null=True, default=None)
    forma_de_entrega = models.CharField(max_length=20, choices=[('expressa', 'Expressa'), ('agendada', 'Agendada')], default='expressa')  # Atualizada na view ecommerce:forma_de_entrega
    entrega_pelo_app = models.BooleanField(default=True)   # É preciso implementar isso a depender do plano da loja...
    taxa_de_entrega = models.DecimalField(max_digits=10, decimal_places=2, default=None, null=True)   # Atualizada na view ecommerce:confirmar_pedido  | não vai ser alterada por "entrega_pelo_app"
    peso = models.DecimalField(max_digits=10, decimal_places=2, validators=[MinValueValidator(0)], default=0)  # Atualizada na view ecommerce:confirmar_pedido
    volume = models.DecimalField(max_digits=10, decimal_places=2, validators=[MinValueValidator(0)], default=0)  # Atualizada na view ecommerce:confirmar_pedido
    is_active = models.BooleanField(default=True)
    datetime = models.DateTimeField(auto_now_add=True)
    status = models.CharField(max_length=50, 
        choices=[
            ('aguardando confirmação da loja', 'Aguardando confirmação da loja'),
            ('preparando o pedido', 'Preparando o pedido'),
            ('a caminho da loja', 'A caminho da loja'), 
            ('saiu para entrega', 'Saiu para entrega'),   
            ('cancelada', 'Cancelada'),
            ('entregue', 'Entregue')
        ],
        default="aguardando confirmação da loja"
    )
    
    def __str__(self):
        return f"Entrega {self.id}: para {self.pedido.user} do pedido {self.pedido.id} - {self.status}"
    

class EntregaAgendada(Entrega):
    datetime_entrega = models.DateTimeField(default=None, null=True)
    
    def __str__(self):
        return f"Entrega {self.id} para {self.pedido.user} a ser realizada em {self.datetime_entrega.strftime('%d/%m/%Y %H:%M')}"



