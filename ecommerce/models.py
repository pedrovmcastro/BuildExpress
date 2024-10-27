from django.db import models
from django.contrib.auth.models import AbstractUser

import os

from . import utils


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
            image_field.name = utils.rename_image(self, image_field.name)

            # Salva o objeto novamente para atualizar o caminho no banco de dados
            super().save(*args, **kwargs)

            # Renomeia o arquivo fisicamente
            new_path = image_field.path
            os.rename(old_path, new_path)


class User(AbstractUser):
    nome = models.CharField(max_length=200)
    cpf = models.CharField(max_length=15, unique=True)
    telefone = models.CharField(max_length=20, default=None, unique=True)
    pass


class Endereco(models.Model):
    logradouro = models.CharField(max_length=100)
    numero = models.IntegerField(null=True, blank=True)
    bairro = models.CharField(max_length=100)
    cidade = models.CharField(max_length=50)
    uf = models.CharField(max_length=2, default=None)
    cep = models.CharField(max_length=15)
    
    def __str__(self):
        return f"{self.logradouro}, {self.numero}, {self.bairro}, {self.cidade} - {self.cep}"


class Loja(RenamableImageModel):
    nome = models.CharField(max_length=100)
    cnpj = models.CharField(max_length=20)
    ie = models.CharField(max_length=15)
    nota = models.DecimalField(max_digits=3, decimal_places=2, null=True, blank=True)
    id_endereco = models.ForeignKey(Endereco, on_delete=models.CASCADE)
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
    nota = models.DecimalField(max_digits=3, decimal_places=2, null=True, blank=True)
    loja = models.ForeignKey(Loja, on_delete=models.CASCADE)
    categoria = models.ForeignKey(Categoria, null=True, blank=True, on_delete=models.SET_NULL)
    photo = models.ImageField(upload_to=utils.rename_image, null=True, blank=True)

    image_field_name = 'photo'

    def __str__(self):
        return self.nome


class Wishlist(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    produto = models.ForeignKey(Produto, on_delete=models.CASCADE)

    def __str__(self):
        return f"{self.user} adicionou {self.produto} a sua lista de desejos."
    

class Comentario(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    produto = models.ForeignKey(Produto, on_delete=models.CASCADE)
    content = models.TextField()
    datetime_submited = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return f"{self.user} comentou na página do {self.produto} às {self.datetime_submited}"