from django.shortcuts import get_object_or_404, render
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework_simplejwt.authentication import JWTAuthentication
from PlaceApp.serializer import FavoritePlaceSerializer, PlaceSerializer, PlaceTagSerializer
from .models import FavoritePlace, PlaceModel, PlaceANDTag
from rest_framework.permissions import IsAuthenticatedOrReadOnly,IsAuthenticated


# Create your views here.
class PlaceView(APIView):
    
    authenticated_users = [JWTAuthentication]
    permission_classes = [IsAuthenticated]
    
    def get(self, request):
        
        places = PlaceANDTag.objects.all()
        
        serializer = PlaceTagSerializer(places, many=True)
        
        return Response(serializer.data)

class PlaceViewFavorite(APIView):
    
    authenticated_users = [JWTAuthentication]
    permission_classes = [IsAuthenticated]
    
    def get(self, request):
        
        user = request.user
        
        favorite_places = FavoritePlace.objects.filter(user=user.id)
        
        serializer = FavoritePlaceSerializer(favorite_places, many=True)
        
        # Obtener los IDs de los lugares favoritos
        id_favorite_places = [favorite_place.place_id for favorite_place in favorite_places]
        
        # Obtener los detalles de los artículos favoritos
        places = PlaceModel.objects.filter(id__in=id_favorite_places)
        places_serializer = PlaceSerializer(places, many=True)
        
        # Mapear los detalles del lugar a cada artículo favorito en la lista
        for data in serializer.data:
            place_id = data['place']
            place_detail = next((item for item in places_serializer.data if item['id'] == place_id), None)
            if place_detail:
                data['place_detail'] = place_detail
        
        return Response(serializer.data)
    
    def post(self, request):
        user = request.user
        
        place_id = request.data.get('place_id')
        
        # Obtener la instancia del lugar
        ubicacion = get_object_or_404(PlaceModel, id=place_id)
        
        try:
            #Si esta en favorito quitarlo
            FavoritePlace.objects.get(place=ubicacion, user=user).delete()
            return Response({"detail": "Eliminaste el lugar de tus favoritos"})
        except FavoritePlace.DoesNotExist:
            #Si no esta en favorito agregarlo
            favorite = FavoritePlace.objects.create(place=ubicacion, user=user)
            serializer = FavoritePlaceSerializer(favorite)
            return Response(serializer.data)