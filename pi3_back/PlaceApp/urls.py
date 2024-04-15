from django.urls import path
from PlaceApp.views import PlaceView, PlaceViewFavorite

urlpatterns = [
        path("places/", PlaceView.as_view(), name="places"),
        path("favorite/", PlaceViewFavorite.as_view(), name="favorite"),
]
