# Generated by Django 5.1.2 on 2024-10-24 13:24

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('ecommerce', '0004_endereco_uf_alter_loja_cnpj_alter_loja_ie'),
    ]

    operations = [
        migrations.AlterField(
            model_name='endereco',
            name='numero',
            field=models.IntegerField(null=True),
        ),
    ]
