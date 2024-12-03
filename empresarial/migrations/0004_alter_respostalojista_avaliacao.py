# Generated by Django 5.1.2 on 2024-12-03 22:26

import django.db.models.deletion
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('ecommerce', '0014_alter_avaliacaoloja_nota'),
        ('empresarial', '0003_respostalojista'),
    ]

    operations = [
        migrations.AlterField(
            model_name='respostalojista',
            name='avaliacao',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='respostas', to='ecommerce.avaliacao'),
        ),
    ]
