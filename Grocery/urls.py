from django.contrib import admin
from django.urls import path,include
from . import views

# for display image
from django.conf.urls.static import static
from django.conf import settings
media_url=settings.MEDIA_URL

urlpatterns = [
    path('admin/', admin.site.urls),
    path('', views.home),
    # Register,Login,Logout
    path('Register/', views.Register),
    path('Login/', views.Login),
    path('logout1/',views.logout1),
    path('cart/',views.cart),
    path('payment/',views.payment),
    path('Delete_Product/',views.Delete_Product),
    path('getcategory/',views.getcategory),
    path('adminhome/',include('adminapp.urls')),
    # Category  
]+static(settings.MEDIA_URL,document_root=settings.MEDIA_ROOT)
