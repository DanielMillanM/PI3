from django.urls import path
from rest_framework_simplejwt.views import TokenObtainPairView, TokenRefreshView
from .views import Register

urlpatterns = [
        path("login/", TokenObtainPairView.as_view(), name="login"),
        path("register/", Register.as_view(), name="register"),
]
