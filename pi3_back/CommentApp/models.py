from django.db import models
from usuario.models import User
from PlaceApp.models import PlaceModel

class CommentModel(models.Model):

    id = models.AutoField(primary_key=True)
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    place = models.ForeignKey(PlaceModel, on_delete=models.CASCADE)
    desc = models.CharField(max_length=100)
    rate = models.IntegerField(default=0)
