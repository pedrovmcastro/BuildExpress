import os
from django.db import models

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


class Endereco(models.Model):
    logradouro = models.CharField(max_length=100)
    numero = models.IntegerField(null=True, blank=True)
    bairro = models.CharField(max_length=100)
    cidade = models.CharField(max_length=50)
    uf = models.CharField(max_length=2, default=None)
    cep = models.CharField(max_length=10)
    
    def __str__(self):
        return f"{self.logradouro}, {self.numero}, {self.bairro}, {self.cidade} - {self.cep}"


class Loja(RenamableImageModel):
    nome = models.CharField(max_length=100)
    cnpj = models.CharField(max_length=14)
    ie = models.CharField(max_length=12)
    nota = models.DecimalField(max_digits=3, decimal_places=2, default=None)
    id_endereco = models.ForeignKey(Endereco, on_delete=models.CASCADE)
    logo = models.ImageField(upload_to=utils.rename_image, null=True, blank=True)

    image_field_name = 'logo'

    def __str__(self):
        return self.nome


class Produto(RenamableImageModel):
    nome = models.CharField(max_length=100)
    descricao = models.TextField()
    preco = models.DecimalField(max_digits=10, decimal_places=2)
    peso = models.DecimalField(max_digits=10, decimal_places=2)
    nota = models.DecimalField(max_digits=3, decimal_places=2, default=None)
    id_loja = models.ForeignKey(Loja, on_delete=models.CASCADE)
    photo = models.ImageField(upload_to=utils.rename_image, null=True, blank=True)

    image_field_name = 'photo'

    def __str__(self):
        return self.nome

