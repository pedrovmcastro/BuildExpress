# Generated by Django 5.1.2 on 2024-11-05 13:07

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('ecommerce', '0002_usuariocomum_is_staff_usuariocomum_is_superuser'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='endereco',
            name='usuarios',
        ),
    ]