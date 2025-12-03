from django.shortcuts import render,redirect
from . import models
from adminapp.models import Subcategory,Category,My_Order
from django.contrib.auth import logout
from django.contrib import messages

from django.conf import settings
media_url=settings.MEDIA_URL

from . import emailAPI
from django.http import HttpResponse

import razorpay
from .templatetags.cart import total_cart_price
from django import template
register = template.Library()

# Main Page
def home(request):
      if request.method == "POST":
         product = request.POST.get("product")
         remove = request.POST.get("remove")
         cart = request.session.get("cart")
         if cart :
            quantity = cart.get(product)
            if quantity:
               if remove:
                  if quantity<=1:
                     cart.pop(product)
                  else:
                     cart[product] = quantity-1
               else:
                  cart[product] = quantity+1
            else:
               cart[product] = 1
         else:
            cart = {}
            cart[product] = 1

         request.session['cart'] = cart
         print(' Cart detail :',request.session['cart'])
         return redirect("http://localhost:8000/")
      else:
         cart = request.session.get('cart')
         if not cart:
            request.session['cart'] = {}
         product = None
         category=Category.objects.all()
         save=Subcategory.objects.all()
         return render(request,"index.html",{"category":category,"save":save,'media_url' :media_url})
# Main Page End


def getcategory(request):
      if request.method == "POST":
         product = request.POST.get("product")
         remove = request.POST.get("remove")
         cart = request.session.get("cart")
         if cart :
            quantity = cart.get(product)
            if quantity:
               if remove:
                  if quantity<=1:
                     cart.pop(product)
                  else:
                     cart[product] = quantity-1
               else:
                  cart[product] = quantity+1
            else:
               cart[product] = 1
         else:
            cart = {}
            cart[product] = 1
         request.session['cart'] = cart
         return render(request,"getcategory.html")
      else:
         cart = request.session.get('cart')
         if not cart:
            request.session['cart'] = {}
         product = None
         categoryid=request.GET.get("categoryid")
         category=Category.objects.filter(categoryid=categoryid)
         save=Subcategory.objects.filter(category_id=categoryid)
         return render(request,"getcategory.html",{"category":category,'save':save,'media_url' :media_url })

# Register Page Start
def Register(request):
    if  request.method == 'GET':
      category=Category.objects.all()
      return render(request,"Register.html",{"msg":"","category":category})
    else:
       Username = request.POST.get("Username")
       Email = request.POST.get("Email")
       Password = request.POST.get("Password")
       Confirm = request.POST.get("Confirm")
       Role="user"
       if models.Register.objects.filter(Email=Email).exists():
          return render(request, "Register.html", {"msg_email": "Email already registered!","msg":""})
       
       if len(Password) < 6:
          return render(request, "Register.html", {"msg_pass": "Password must be at least 6 characters long!","msg":""})

       if Password != Confirm:
          return render(request, "Register.html", {"msg_confirm": "Password and Confirm Password Does not match!","msg":""})

       result=models.Register(Username=Username,Email=Email,Password=Password,Confirm=Confirm,Role=Role)
       result.save()
    # to send verifiction email and registered emailid -----------------------
       emailAPI.sendMail(Email,Password)
    # ---------------------------------------------------------------       
       messages.success(request,'Record Saved Successfully!')
       return redirect("/Login/",{"msg":"Record Saved Successfully..."})     
# Register Page End 

# email send  start
def emailtesting(request):
  from . import emailAPItesting
  email = "ydeep9154@gmail.com"
  password= "deep@9154*"
  res = emailAPItesting.sendMail(email,password)
  return HttpResponse(res)
# email End 

# Login Page Start
def Login(request):
  if request.method=="GET":
   category=Category.objects.all()
   return render(request,"Login.html",{"category":category})  
  else:
   Email=request.POST.get("Email")
   Password=request.POST.get("Password")
   res=models.Register.objects.filter(Email=Email,Password=Password)
   if not models.Register.objects.filter(Email=Email).exists():
      return render(request,"Login.html",{"msg_email":"Email not registerd...","msg_pass":"","msg":""})
   if not res.exists():
      return render(request,"Login.html",{"msg_email":"","msg_pass":"Incorrect password try again..","msg":""})
   if len(res)>0:
     Role=res[0].Role
     request.session["Email"]=Email
     request.session["Role"]=Role
     print(Role)
     print("login success")
     if Role=="admin":
       print("role-",Role)
       messages.success(request,'Login Successfully!..')
       return redirect("/adminhome/")         
     elif Role=="user":
       print("role-",Role)
       messages.success(request,'Login Successfully!..')
       return redirect("http://localhost:8000/")
   else:
     print("invalid email id or pwd")  
   return render(request,"Login.html") 
# Login Page End  

# Logout Start
def logout1(request):
 del request.session["Email"]
 del request.session["Role"]
 logout(request)
 messages.error(request,"Logged Out Successfully..")
 return redirect("http://localhost:8000/")
# Logout End

def Register_User(request):
    result=models.Register.objects.all() 
    return render(request,"Register_User.html",{"result":result})


def cart(request):
   if request.method == "GET":
      ids = (list(request.session.get('cart').keys()))
      product = Subcategory.get_products_by_id(ids)
      print(product)
      return render(request,"cart.html",{'product':product,'media_url' :media_url})
   else:
       if request.session.get ("Email") :
         address = request.POST.get("address")
         phone = request.POST.get("phone")
         city = request.POST.get("city")
         pincode = request.POST.get("pincode")
         save=My_Order(address=address,phone=phone,city=city,pincode=pincode)
         save.save()
         messages.success(request,'Your Address Saved !..')
         return  redirect("/payment/")
       else:
          return redirect("/Login/")
   
def Delete_Product(request):
   if request.method=="GET":
     id=request.GET.get("id")
     product=My_Order.objects.get(id=id) 
     product.delete()
     messages.success(request,'Address deleted Successfully!')
     return redirect("/payment/")
   else:
      pass  

def payment(request):
   if request.method == "GET":
      ids = (list(request.session.get('cart').keys()))
      product = Subcategory.get_products_by_id(ids)
      print(product)
      save=My_Order.objects.all()
      return render(request,"payment.html",{'product':product,'save':save,'media_url' :media_url})
   else:
      address = request.POST.get("address")
      phone = request.POST.get("phone")
      city = request.POST.get("city")
      pincode = request.POST.get("pincode")

      save=My_Order(address=address,phone=phone,city=city,pincode=pincode)
      save.save()
      # payment Integration with Rozarpay payment
      # total=total_cart_price(products,cart)
      # amount = total * 100
      amount = 800000
      client = razorpay.Client(auth=(settings.RAZORPAY_KEY_ID, settings.RAZORPAY_KEY_SECRET))
      payment = client.order.create({
         'amount': amount ,
         'currency': 'INR',
         'payment_capture': '1'
      })
      messages.success(request,'Your Address Saved !..')
      return  redirect("/payment/",{'payment':payment,'key_id': settings.RAZORPAY_KEY_ID})   
