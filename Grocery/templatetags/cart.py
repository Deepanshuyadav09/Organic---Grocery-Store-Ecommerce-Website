from django import template
register = template.Library()

@register.filter(name='is_in_cart')
def is_in_cart(product , cart):
    keys = cart.keys()
    for id in keys:
        if int(id) == product.subcategoryid:
            return True
    return False

@register.filter(name='cart_quantity')
def cart_quantity(product , cart):
    keys = cart.keys()
    for id in keys:
        if int(id) == product.subcategoryid:
            return cart.get(id)
    return 0;
# ---------------------------------------------------------------
@register.filter(name='price_total')
def price_total(product , cart):
    return product.price * cart_quantity(product , cart)

@register.filter(name='total_cart_price')
def total_cart_price(products ,cart):
    sum = 0 ;
    for p in products:
        sum += price_total(p , cart)
    return sum
# ----------------------------------------------------------------
@register.filter(name='del_price_total')
def del_price_total(product , cart):
    return product.del_price * cart_quantity(product , cart)

@register.filter(name='total_del_price')
def total_del_price(products ,cart):
    sum = 0 ;
    for p in products:
        sum += del_price_total(p , cart)
    return sum
# --------------------------------------------------------------------

@register.filter(name='currency')
def currency(number):
    return "₹ " +str(number)