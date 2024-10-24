# Generated by Django 5.1.2 on 2024-10-23 16:34

import django.core.validators
import django.db.models.deletion
from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Endereco',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('logradouro', models.CharField(max_length=100)),
                ('numero', models.IntegerField()),
                ('bairro', models.CharField(max_length=100)),
                ('cidade', models.CharField(max_length=50)),
                ('cep', models.CharField(max_length=10)),
            ],
        ),
        migrations.CreateModel(
            name='Loja',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('nome', models.CharField(max_length=100)),
                ('cnpj', models.CharField(max_length=14, unique=True, validators=[django.core.validators.RegexValidator(message='CNPJ inválido', regex='^\\d{14}$')])),
                ('ie', models.CharField(max_length=14, unique=True, validators=[django.core.validators.RegexValidator(message='IE inválida', regex='^\\d{9}$')])),
                ('nota', models.DecimalField(decimal_places=2, max_digits=3)),
                ('logo', models.ImageField(blank=True, null=True, upload_to='logos/')),
                ('id_endereco', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='ecommerce.endereco')),
            ],
        ),
        migrations.CreateModel(
            name='Produto',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('nome', models.CharField(max_length=100)),
                ('descricao', models.TextField()),
                ('preco', models.DecimalField(decimal_places=2, max_digits=10)),
                ('peso', models.DecimalField(decimal_places=2, max_digits=10)),
                ('photo', models.ImageField(blank=True, null=True, upload_to='produtos/')),
                ('id_loja', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='ecommerce.loja')),
            ],
        ),
    ]
