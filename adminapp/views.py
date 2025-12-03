from django.shortcuts import render,redirect,HttpResponse
from . import models
from  Grocery.models import Register
from django.contrib.auth import logout
from django.contrib import messages
from django.core.files.storage import FileSystemStorage

from django.conf import settings
media_url=settings.MEDIA_URL

# Middle Ware start
def sessioncheckadmin_middleware(get_response):
 def middleware(request):
    if request.path=='/adminhome/' or request.path=='/adminhome/category/' or request.path=='/adminhome/Editcategory/'or request.path=='/adminhome/Register_User/' or request.path=='/adminhome/viewcategory/':
      if "Email" not in request.session:  
            response=redirect('/Login/')
      else:
            response=get_response(request)
    else:
        response=get_response(request)
    return response
 return middleware 
# Middle Ware End
                                   # home Page
def adminhome(request):
    return render(request,"adminhome.html")

                                         # Add Category 

def category(request):
    if request.method=="GET":
        res=models.Category.objects.all()
        result=models.Subcategory.objects.all()
        return render(request,"category.html",{"res":res,"result":result})
    else:
#   for file uploding.......................................................
        image=request.FILES["image"]
        fs=FileSystemStorage()
        img=fs.save(image.name,image)
# .......................................................................
        subcategoryid=request.POST.get("subcategoryid")
        subcategoryname=request.POST.get("subcategoryname")
        rating=request.POST.get("rating")
        del_price=request.POST.get("del_price")
        price=request.POST.get("price")
        discount=request.POST.get("discount")
        category=request.POST.get("category")
        res=models.Subcategory(subcategoryid=subcategoryid,subcategoryname=subcategoryname,rating=rating,del_price=del_price,price=price,
                           discount=discount,category_id=category,image=image)
        res.save()
        messages.success(request,'New Product Added!..')
        return render(request,"category.html",{"result":""}) 

                                       # Edit category Page  
def Editcategory(request):
   if request.method=="GET":
    subcategoryid=request.GET.get("subcategoryid")
    res=models.Subcategory.objects.filter(subcategoryid=subcategoryid)
    print("Success Edit")
    return render(request,"Editcategory.html",{"res":res})
   else:
#   for file uploding.......................................................
        image=request.FILES["image"]
        fs=FileSystemStorage()
        img=fs.save(image.name,image)
# .......................................................................
        subcategoryid=request.POST.get("subcategoryid")
        subcategoryname=request.POST.get("subcategoryname")
        rating=request.POST.get("rating")
        category=request.POST.get("category")
        del_price=request.POST.get("del_price")
        price=request.POST.get("price")
        discount=request.POST.get("discount")
        res=models.Subcategory.objects.filter(subcategoryid=subcategoryid).update(subcategoryname=subcategoryname,rating=rating,category_id=category,del_price=del_price,
                                                            price=price,discount=discount,image=image)
        messages.success(request,'Product Edited Successfully!')
        return redirect("/adminhome/viewcategory/")       
    
                                        #View Category dekhna
def viewcategory(request):
   save=models.Subcategory.objects.all()
   return render(request,"viewcategory.html",{"save":save,'media_url' :media_url})
   
                                               
                                        #_Delete Karna database se 
def Delete_Product(request):
   if request.method=="GET":
     subcategoryid=request.GET.get("subcategoryid")
     product=models.Subcategory.objects.get(subcategoryid=subcategoryid) 
     product.delete()
     messages.success(request,'Product deleted Successfully!')
     return redirect("/adminhome/viewcategory/")
   else:
      return HttpResponse("Product id is not found ")
   
                                      
                                      # Register User Dekhna
def Register_User(request):
    result=Register.objects.all() 
    return render(request,"Register_User.html",{"result":result})

                                     # page logout Karna
def logout1(request):
 logout(request)
 messages.error(request,"Logged Out Successfully..")
 return redirect("http://localhost:8000")          