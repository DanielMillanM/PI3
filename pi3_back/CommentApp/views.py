from django.shortcuts import render, get_object_or_404
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework_simplejwt.authentication import JWTAuthentication
from .serializer import CommentSerializer
from .models import CommentModel
from PlaceApp.models import PlaceModel
from rest_framework.permissions import IsAuthenticatedOrReadOnly,IsAuthenticated

# Create your views here.

class CommentViewFavorite(APIView):
    
    authenticated_users = [JWTAuthentication]
    permission_classes = [IsAuthenticated]
    
    def get(self, request, place_id):
        
        user = request.user
        
        ubicacion = get_object_or_404(PlaceModel, id=place_id)
        
        comments = CommentModel.objects.filter(place=ubicacion)
        
        serializer = CommentSerializer(comments, many=True)
        
        return Response(serializer.data)
    
    def post(self, request, place_id):
        user = request.user
        
        comment = request.data.get('comment')
        rate = request.data.get('rate')
        
        ubicacion = get_object_or_404(PlaceModel, id=place_id)
        
        comment = CommentModel.objects.create(user=user, place=ubicacion, desc=comment, rate=rate)
        serializer = CommentSerializer(comment)
        
        return Response(serializer.data)
        
        