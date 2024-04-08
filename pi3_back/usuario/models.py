from django.db import models
from django.contrib.auth.models import AbstractBaseUser, BaseUserManager

# Create your models here.
class Manager_account(BaseUserManager):
    def create_user(self,name, email,password=None, repassword = None):
        
        user = self.model(
            name = name,
            email = email,
        )
        
        user.set_password(password)
        user.is_active = True
        user.save(using = self._db)
        return user
    
    def create_superuser(self,name, email,password, repassword = None):
        
        user = self.create_user(
            name = name,
            email = email,
        )
        
        user.set_password(password)
        user.is_admin = True
        user.is_active = True
        user.is_staff = True
        user.is_superuser = True
        user.save(using = self._db)
        return user


#clase usuario
class User(AbstractBaseUser):
    
    #atributos usuario
    id = models.AutoField(primary_key=True,unique=True)
    name = models.CharField(max_length=100)
    email = models.EmailField(max_length=200,unique=True)

    #atributos de django
    date_joined = models.DateTimeField(auto_now_add=True)
    last_login = models.DateTimeField(auto_now_add=True)
    
    #roles de django
    is_admin = models.BooleanField(default=False)
    is_staff = models.BooleanField(default=False)
    is_superuser = models.BooleanField(default=False)
    is_active = models.BooleanField(default=True)
    
    USERNAME_FIELD = 'email'
    REQUIRED_FIELDS = ['name']
    
    objects = Manager_account()
    
    def __str__(self):
        return self.name
    
    def has_perm(self,perm,obj=None):
        return self.is_superuser
    
    def has_module_perms(self,add_label):
        return True