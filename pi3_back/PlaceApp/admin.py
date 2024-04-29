from django.contrib import admin

from .models import PlaceModel, FavoritePlace, TagModel, PlaceANDTag

admin.site.register(PlaceModel)
admin.site.register(FavoritePlace)
admin.site.register(TagModel)
admin.site.register(PlaceANDTag)