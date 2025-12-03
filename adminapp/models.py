from django.db import models
import datetime
from  Grocery.models import Register

class Category(models.Model):
    categoryid=models.AutoField(primary_key=True)
    name = models.CharField(max_length=200)

class Subcategory(models.Model):
    subcategoryid=models.AutoField(primary_key=True)
    subcategoryname = models.CharField(max_length=200)
    rating = models.PositiveSmallIntegerField(default=5) 
    category = models.ForeignKey("Category",on_delete=models.CASCADE,default=1)
    del_price = models.DecimalField(max_digits=10,decimal_places=2,null=True,blank=True)
    price = models.DecimalField(max_digits=10,decimal_places=2,null=True,blank=True)
    discount = models.PositiveIntegerField(default=0)
    image = models.CharField(max_length=60)

    @staticmethod
    def get_products_by_id(ids):
      return Subcategory.objects.filter(subcategoryid__in = ids)

class My_Order(models.Model):
   address = models.CharField(max_length=50,default='',blank=True)
   phone = models.CharField(max_length=25,default='',blank=True)
   city = models.CharField(max_length=25,default='',blank=True)
   pincode = models.IntegerField(default='455001')
   date = models.DateTimeField(default=datetime.datetime.today)

