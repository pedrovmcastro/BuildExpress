# Generated by Django 5.1.2 on 2024-10-25 23:00

import django.db.models.deletion
import ecommerce.utils
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('ecommerce', '0002_user_telefone'),
    ]

    operations = [
        migrations.CreateModel(
            name='Categoria',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('nome', models.CharField(max_length=50)),
                ('photo', models.ImageField(blank=True, null=True, upload_to=ecommerce.utils.rename_image)),
            ],
            options={
                'abstract': False,
            },
        ),
        migrations.AddField(
            model_name='produto',
            name='id_categoria',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.SET_NULL, to='ecommerce.categoria'),
        ),
    ]
