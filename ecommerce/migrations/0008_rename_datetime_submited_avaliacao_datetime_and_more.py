# Generated by Django 5.1.2 on 2024-10-27 23:26

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('ecommerce', '0007_avaliacao'),
    ]

    operations = [
        migrations.RenameField(
            model_name='avaliacao',
            old_name='datetime_submited',
            new_name='datetime',
        ),
        migrations.AddField(
            model_name='avaliacao',
            name='titulo',
            field=models.CharField(default=None, max_length=100),
        ),
    ]
