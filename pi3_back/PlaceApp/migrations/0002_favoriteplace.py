# Generated by Django 4.2.3 on 2024-04-08 22:05

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
        ('PlaceApp', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='FavoritePlace',
            fields=[
                ('id', models.AutoField(primary_key=True, serialize=False)),
                ('place', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='PlaceApp.placemodel')),
                ('user', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL)),
            ],
        ),
    ]
