# Generated by Django 5.1.2 on 2024-11-15 22:23

import django.db.models.deletion
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('ecommerce', '0009_alter_cupom_desconto_pedido'),
    ]

    operations = [
        migrations.AddField(
            model_name='pedido',
            name='cupom',
            field=models.ForeignKey(blank=True, default=None, null=True, on_delete=django.db.models.deletion.SET_NULL, to='ecommerce.cupom'),
        ),
    ]
