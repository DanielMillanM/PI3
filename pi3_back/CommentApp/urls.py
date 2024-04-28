from django.urls import path
from CommentApp.views import CommentViewFavorite

urlpatterns = [
        path("comments/<int:place_id>/", CommentViewFavorite.as_view(), name="comments")
]