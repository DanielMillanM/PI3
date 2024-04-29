from django.db import models
from usuario.models import User

class PlaceModel(models.Model):

    id = models.AutoField(primary_key=True)
    name = models.CharField(max_length=50)
    x = models.CharField(max_length=50)
    y = models.CharField(max_length=50)
    schedule = models.CharField(max_length=100)
    history = models.CharField(max_length=255)
    link= models.CharField(max_length=300)

    def __str__(self):

        return self.name
    
class TagModel(models.Model):

    id = models.AutoField(primary_key=True)
    name = models.CharField(max_length=20)
    
    def __str__(self):

        return self.name

class PlaceANDTag(models.Model):

    id = models.AutoField(primary_key=True)
    place = models.ForeignKey(PlaceModel, on_delete=models.CASCADE)
    tag = models.ForeignKey(TagModel, on_delete=models.CASCADE)
    
    def __str__(self):

        return (self.place, self.tag)

class FavoritePlace(models.Model):

    id = models.AutoField(primary_key=True)
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    place = models.ForeignKey(PlaceModel, on_delete=models.CASCADE)

