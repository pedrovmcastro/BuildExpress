# Generated by Django 5.1.2 on 2024-11-02 03:49

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('ecommerce', '0001_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='usuariocomum',
            name='is_staff',
            field=models.BooleanField(default=False),
        ),
        migrations.AddField(
            model_name='usuariocomum',
            name='is_superuser',
            field=models.BooleanField(default=False),
        ),
    ]
