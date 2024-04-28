from rest_framework import serializers
from .models import CommentModel

class CommentSerializer(serializers.ModelSerializer):
    name = serializers.CharField(source='user.name', read_only=True)

    class Meta:
        model = CommentModel
        fields = ['id', 'name', 'place', 'desc', 'rate']