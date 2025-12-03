from django.db import models

class Register(models.Model):
    Username = models.CharField(max_length=50)
    Email = models.CharField(max_length=50)
    Password = models.IntegerField()
    Confirm = models.IntegerField()
    Role = models.CharField(max_length=15,default='user')
