from django.contrib import admin

from .models import PlaceModel, FavoritePlace

admin.site.register(PlaceModel)
admin.site.register(FavoritePlace)