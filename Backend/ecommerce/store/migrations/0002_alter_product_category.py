# Generated by Django 5.0.6 on 2024-06-04 19:38

import django.db.models.deletion
import mptt.fields
from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('store', '0001_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='product',
            name='category',
            field=mptt.fields.TreeForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, related_name='products', to='store.category'),
        ),
    ]
