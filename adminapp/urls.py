from django.contrib import admin
from django.urls import path
from . import views

from django.conf.urls.static import static
from django.conf import settings
media_url=settings.MEDIA_URL

urlpatterns = [
      path('',views.adminhome),
      path('Register_User/',views.Register_User),

      path('category/',views.category),
      path('Editcategory/',views.Editcategory),
      path('viewcategory/',views.viewcategory),
      path('Delete_Product/',views.Delete_Product),
      
      path('logout1/',views.logout1),
]+static(settings.MEDIA_URL,document_root=settings.MEDIA_ROOT)