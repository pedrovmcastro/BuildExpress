# Generated by Django 5.1.2 on 2024-10-28 03:08

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('ecommerce', '0009_alter_produto_nota'),
    ]

    operations = [
        migrations.AddField(
            model_name='produto',
            name='avaliacoes',
            field=models.IntegerField(default=0),
        ),
    ]