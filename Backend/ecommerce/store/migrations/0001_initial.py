# Generated by Django 5.0.6 on 2024-06-07 10:45

import django.db.models.deletion
from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Category',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=50, unique=True)),
                ('key_words', models.CharField(blank=True, max_length=255, null=True)),
                ('description', models.CharField(blank=True, max_length=255, null=True)),
                ('image', models.ImageField(blank=True, null=True, upload_to='uploads/categories/')),
                ('slug', models.SlugField(blank=True, null=True, unique=True)),
            ],
            options={
                'verbose_name_plural': 'Categories',
            },
        ),
        migrations.CreateModel(
            name='MobileBanner',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('image', models.ImageField(upload_to='uploads/banners/', verbose_name='Image')),
                ('caption', models.CharField(blank=True, max_length=255, null=True, verbose_name='Caption')),
                ('created_at', models.DateTimeField(auto_now_add=True, verbose_name='Created At')),
                ('in_use', models.BooleanField(default=False)),
            ],
            options={
                'verbose_name_plural': 'Mobile Banners',
            },
        ),
        migrations.CreateModel(
            name='WebBanner',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('image', models.ImageField(upload_to='uploads/banners/', verbose_name='Image')),
                ('caption', models.CharField(blank=True, max_length=255, null=True, verbose_name='Caption')),
                ('created_at', models.DateTimeField(auto_now_add=True, verbose_name='Created At')),
                ('in_use', models.BooleanField(default=False)),
            ],
            options={
                'verbose_name_plural': 'Web Banners',
            },
        ),
        migrations.CreateModel(
            name='Product',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('profile_image', models.ImageField(blank=True, default='default/product.png', null=True, upload_to='uploads/products')),
                ('name', models.CharField(max_length=255, verbose_name='Product Name')),
                ('price', models.DecimalField(decimal_places=2, max_digits=12)),
                ('description', models.TextField(blank=True, null=True, verbose_name='Product Description')),
                ('is_sale', models.BooleanField(default=False)),
                ('sale_price', models.DecimalField(blank=True, decimal_places=2, max_digits=12, null=True)),
                ('discount', models.DecimalField(blank=True, decimal_places=2, default=0, max_digits=9, null=True)),
                ('percentage_discount', models.DecimalField(blank=True, decimal_places=0, default=0, max_digits=5, null=True)),
                ('created_at', models.DateTimeField(auto_now_add=True)),
                ('is_listed', models.BooleanField(default=True)),
                ('is_featured', models.BooleanField(default=False)),
                ('slug', models.SlugField(blank=True, null=True, unique=True)),
                ('key_words', models.CharField(blank=True, max_length=255, null=True)),
                ('stock_quantity', models.IntegerField(default=1)),
                ('brand', models.CharField(blank=True, max_length=255, null=True)),
                ('material', models.CharField(blank=True, max_length=255, null=True)),
                ('color', models.CharField(blank=True, max_length=255)),
                ('size', models.CharField(blank=True, max_length=255)),
                ('category', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, related_name='products', to='store.category')),
            ],
        ),
        migrations.CreateModel(
            name='ProductImage',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('product_images', models.ImageField(blank=True, null=True, upload_to='uploads/products')),
                ('product', models.ForeignKey(default=None, on_delete=django.db.models.deletion.CASCADE, related_name='product_images', to='store.product')),
            ],
            options={
                'verbose_name_plural': 'Product Images',
            },
        ),
    ]
