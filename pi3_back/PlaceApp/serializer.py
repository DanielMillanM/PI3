from rest_framework import serializers
from .models import PlaceModel, FavoritePlace

class PlaceSerializer(serializers.ModelSerializer):
    class Meta:
        model = PlaceModel
        fields = '__all__'
        
class FavoritePlaceSerializer(serializers.ModelSerializer):
    class Meta:
        model = FavoritePlace
        fields = '__all__'