from rest_framework import serializers
from .models import *

class PlaceSerializer(serializers.ModelSerializer):
    class Meta:
        model = PlaceModel
        fields = '__all__'
        
class FavoritePlaceSerializer(serializers.ModelSerializer):
    class Meta:
        model = FavoritePlace
        fields = '__all__'
        
class PlaceTagSerializer(serializers.ModelSerializer):
    name = serializers.CharField(source='place.name', read_only=True)
    placeId = serializers.IntegerField(source='place.id', read_only=True)
    x = serializers.CharField(source='place.x', read_only=True)
    y = serializers.CharField(source='place.y', read_only=True)
    schedule = serializers.CharField(source='place.schedule', read_only=True)
    history = serializers.CharField(source='place.history', read_only=True)
    link = serializers.CharField(source='place.link', read_only=True)
    
    tagName = serializers.CharField(source='tag.name', read_only=True)
    
    class Meta:
        model = PlaceANDTag
        fields = ['name', 'placeId', 'x', 'y', 'schedule', 'history', 'link', 'tagName']
        
class TagSerializer(serializers.ModelSerializer):
    class Meta:
        model = TagModel
        fields = '__all__'