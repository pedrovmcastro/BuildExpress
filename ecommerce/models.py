from django.db import models
from django.contrib.auth.models import AbstractBaseUser, BaseUserManager
from django.core.validators import MinValueValidator, MaxValueValidator
from . import utils
import os


class RenamableImageModel(models.Model):
    """
    Classe base para modelos que contêm um campo de imagem que precisa ser renomeado. 
    """
    image_field_name = None  # Deve ser definido nas subclasses

    class Meta:
        abstract = True  # Define que esta é uma classe abstrata, não será criada uma tabela para ela.
    

    def save(self, *args, **kwargs):
        # Primeiro salva o objeto para garantir que ele tenha um ID
        super().save(*args, **kwargs)

        #Obter o campo de imagem
        image_field = getattr(self, self.image_field_name)

        # Atualiza o nome da imagem se ela já foi carregada
        if image_field and not image_field.name.startswith(f"{self.__class__.__name__}{str(self.id).zfill(6)}"):
            old_path = image_field.path
            print(f"Old path: {old_path}")

            image_field.name = utils.rename_image(self, image_field.name)

            # Salva o objeto novamente para atualizar o caminho no banco de dados
            super().save(*args, **kwargs)

            # Renomeia o arquivo fisicamente
            new_path = image_field.path
            print(f"New path: {new_path}")

            os.rename(old_path, new_path)


class UsuarioComumManager(BaseUserManager):

    def create_user(self, email, password=None, **extra_fields):
        if not email:
            raise ValueError("O email é obrigatório")
        email = self.normalize_email(email)
        extra_fields.setdefault('is_active', True)
        user = self.model(email=email, **extra_fields)
        user.set_password(password)
        user.save()
        return user

    def create_superuser(self, email, password=None, **extra_fields):
        extra_fields.setdefault('is_staff', True)
        extra_fields.setdefault('is_superuser', True)

        if extra_fields.get("is_staff") is not True:
            raise ValueError("Superusuário deve ter is_staff=True.")
        if extra_fields.get("is_superuser") is not True:
            raise ValueError("Superusuário deve ter is_superuser=True.")

        return self.create_user(email, password, **extra_fields)


class UsuarioComum(AbstractBaseUser):
    email = models.EmailField(unique=True)
    nome = models.CharField(max_length=200)
    telefone = models.CharField(max_length=20, unique=True)
    cpf = models.CharField(max_length=15, unique=True)
    is_active = models.BooleanField(default=True)
    is_staff = models.BooleanField(default=False)
    is_superuser = models.BooleanField(default=False)

    USERNAME_FIELD = 'email'

    objects = UsuarioComumManager()

    def has_perm(self, perm, obj=None):
        return self.is_superuser
    
    def has_module_perms(self, app_label):
        return self.is_superuser

    def __str__(self):
        return self.email
    
<<<<<<< HEAD
=======
    @property
    def is_lojista(self):
        return False
    
    @property
    def is_motorista(self):
        return False
    
>>>>>>> 33834d2 (empresarial:cadastro de produtos)

class Endereco(models.Model):
    cep = models.CharField(max_length=15)
    logradouro = models.CharField(max_length=100)
    numero = models.IntegerField(null=True, blank=True)
    bairro = models.CharField(max_length=100)
    cidade = models.CharField(max_length=50)
    estado = models.CharField(max_length=2, default=None)
    
    def __str__(self):
        return f"{self.logradouro}, {self.numero}, {self.bairro}, {self.cidade} - {self.cep}"
    

class Loja(RenamableImageModel):
    nome = models.CharField(max_length=100)
    nome_responsavel = models.CharField(max_length=100, default=None)
    cpf_responsavel = models.CharField(max_length=15, default=None)
    cnpj = models.CharField(max_length=20)
    telefone = models.CharField(max_length=20, default=None)
    plano = models.ForeignKey('empresarial.plano', on_delete=models.SET_NULL, default=None, null=True)
    nota = models.DecimalField(max_digits=3, decimal_places=2, null=True, blank=True)
    endereco = models.ForeignKey(Endereco, on_delete=models.CASCADE)
    lojista = models.ForeignKey('empresarial.lojista', on_delete=models.SET_NULL, default=None, null=True)
    logo = models.ImageField(upload_to=utils.rename_image, null=True, blank=True)

    image_field_name = 'logo'

    def __str__(self):
        return self.nome
    

class Categoria(RenamableImageModel):
    nome = models.CharField(max_length=50)
    photo = models.ImageField(upload_to=utils.rename_image, null=True, blank=True)

    image_field_name = 'photo'

    def __str__(self):
        return self.nome


class Produto(RenamableImageModel):
    nome = models.CharField(max_length=100)
    descricao = models.TextField()
    preco = models.DecimalField(max_digits=10, decimal_places=2)
    peso = models.DecimalField(max_digits=10, decimal_places=2)
    nota = models.DecimalField(max_digits=3, decimal_places=2, default=None, null=True, blank=True)
    avaliacoes = models.IntegerField(default=0)
    loja = models.ForeignKey(Loja, on_delete=models.CASCADE)
    categoria = models.ForeignKey(Categoria, null=True, blank=True, on_delete=models.SET_NULL)
    photo = models.ImageField(upload_to=utils.rename_image, null=True, blank=True)

    image_field_name = 'photo'

    def __str__(self):
        return self.nome


class Wishlist(models.Model):
    user = models.ForeignKey(UsuarioComum, on_delete=models.CASCADE)
    produto = models.ForeignKey(Produto, on_delete=models.CASCADE)

    def __str__(self):
        return f"{self.user} adicionou {self.produto} a sua lista de desejos."
    

class Avaliacao(models.Model):
    user = models.ForeignKey(UsuarioComum, on_delete=models.CASCADE)
    produto = models.ForeignKey(Produto, on_delete=models.CASCADE)
    titulo = models.CharField(max_length=100, default=None)
    conteudo = models.TextField( )
    nota = models.IntegerField(validators=[MinValueValidator(0), MaxValueValidator(5)])
    datetime = models.DateTimeField(auto_now_add=True)
    recomenda = models.BooleanField()

    def __str__(self):
        return f"{self.user} avaliou o produto {self.produto} às {self.datetime_submited}"
    