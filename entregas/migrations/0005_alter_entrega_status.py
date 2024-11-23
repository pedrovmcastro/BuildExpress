# Generated by Django 5.1.2 on 2024-11-22 13:36

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('entregas', '0004_rename_tipo_entrega_entrega_forma_de_entrega_and_more'),
    ]

    operations = [
        migrations.AlterField(
            model_name='entrega',
            name='status',
            field=models.CharField(choices=[('aguardando confirmação da loja', 'Aguardando confirmação da loja'), ('preparando o pedido', 'Preparando o pedido'), ('a caminho da loja', 'A caminho da loja'), ('saiu para entrega', 'Saiu para entrega'), ('cancelada', 'Cancelada'), ('entregue', 'Entregue')], default='aguardando confirmação da loja', max_length=50),
        ),
    ]
