# Generated by Django 5.1.2 on 2024-11-06 13:52

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('ecommerce', '0003_remove_endereco_usuarios'),
    ]

    operations = [
        migrations.AddField(
            model_name='loja',
            name='pedido_minimo',
            field=models.DecimalField(blank=True, decimal_places=2, default=None, max_digits=10, null=True),
        ),
    ]
