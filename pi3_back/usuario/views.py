from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status
from .serializer import *
from .models import *

class Register(APIView):
    
    def post(self,request):
        
        serializers = UserSerializer(data = request.data)
        
        if serializers.is_valid():
            
            user = User.objects.create_user(**serializers.validated_data)
            user.save()
            
            return Response({'message': 'Usuario registrado'}, status=status.HTTP_201_CREATED)
        return Response(serializers.errors, status=status.HTTP_400_BAD_REQUEST)