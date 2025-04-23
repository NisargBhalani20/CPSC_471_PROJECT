from django.db import models
from django.contrib.auth.models import User

# 1. User Model (extends Django's User)
class User(models.Model):
    user_id = models.AutoField(primary_key=True)
    name = models.CharField(max_length=255)
    email = models.EmailField(unique=True)
    phone = models.CharField(max_length=20)
    user_type = models.CharField(max_length=20)  # 'owner', 'customer'

    def __str__(self):
        return self.name

# 2. Business Owner Model
class BusinessOwner(models.Model):
    owner = models.OneToOneField(User, on_delete=models.CASCADE, primary_key=True)

    def __str__(self):
        return self.owner.name

# 3. Customer Model
class Customer(models.Model):
    customer_id = models.AutoField(primary_key=True)
    name = models.CharField(max_length=255)
    phone_number = models.CharField(max_length=20)

    def __str__(self):
        return self.name

# 4. Supplier Model
class Supplier(models.Model):
    supplier_id = models.AutoField(primary_key=True)
    name = models.CharField(max_length=255)
    contact_info = models.TextField()

    def __str__(self):
        return self.name

# 5. Product Model
class Product(models.Model):
    product_id = models.AutoField(primary_key=True)
    name = models.CharField(max_length=255)
    description = models.TextField(blank=True)
    price = models.DecimalField(max_digits=10, decimal_places=2)
    quantity = models.IntegerField(default=0)
    location = models.CharField(max_length=255)

    suppliers = models.ManyToManyField(Supplier, through='Delivers')

    def __str__(self):
        return self.name

# 6. Supply Model
class Supply(models.Model):
    supply_id = models.AutoField(primary_key=True)
    name = models.CharField(max_length=255)
    cost = models.DecimalField(max_digits=10, decimal_places=2)
    supplier = models.ForeignKey(Supplier, on_delete=models.CASCADE)

    products = models.ManyToManyField(Product, through='ComposedOf')

    def __str__(self):
        return self.name

# 7. Inventory Model
class Inventory(models.Model):
    inventory_id = models.AutoField(primary_key=True)
    location = models.CharField(max_length=255)
    capacity = models.IntegerField()
    products = models.ManyToManyField(Product, through='StoredIn')

    def __str__(self):
        return f"{self.location} (Capacity: {self.capacity})"

# 8. Order Model
class Order(models.Model):
    ORDER_STATUS = (
        ('pending', 'Pending'),
        ('approved', 'Approved'),
        ('denied', 'Denied')
    )
    
    order_id = models.AutoField(primary_key=True)
    order_date = models.DateField()
    total_amount = models.DecimalField(max_digits=10, decimal_places=2)
    customer = models.ForeignKey(Customer, on_delete=models.CASCADE)
    products = models.ManyToManyField(Product, through='Contains')
    status = models.CharField(max_length=10, choices=ORDER_STATUS, default='pending')

    def __str__(self):
        return f"Order {self.order_id}"

# 9. Shipment Model
class Shipment(models.Model):
    shipment_id = models.AutoField(primary_key=True)
    shipping_date = models.DateField()
    tracking_number = models.CharField(max_length=255)
    order = models.OneToOneField(Order, on_delete=models.CASCADE)

    def __str__(self):
        return f"Shipment {self.shipment_id}"

# 10. Intermediary Table: Contains (Order contains Product)
class Contains(models.Model):
    order = models.ForeignKey(Order, on_delete=models.CASCADE)
    product = models.ForeignKey(Product, on_delete=models.CASCADE)
    quantity = models.IntegerField(default=1)

    def __str__(self):
        return f"{self.order} - {self.product} (Qty: {self.quantity})"

# 11. Intermediary Table: Delivers (Supplier delivers Product)
class Delivers(models.Model):
    supplier = models.ForeignKey(Supplier, on_delete=models.CASCADE)
    product = models.ForeignKey(Product, on_delete=models.CASCADE)

# 12. Intermediary Table: ComposedOf (Supply used in Product)
class ComposedOf(models.Model):
    supply = models.ForeignKey(Supply, on_delete=models.CASCADE)
    product = models.ForeignKey(Product, on_delete=models.CASCADE)

# 13. Intermediary Table: StoredIn (Product stored in Inventory)
class StoredIn(models.Model):
    inventory = models.ForeignKey(Inventory, on_delete=models.CASCADE)
    product = models.ForeignKey(Product, on_delete=models.CASCADE)
    quantity = models.IntegerField(default=0)

    class Meta:
        unique_together = ('inventory', 'product')

    def __str__(self):
        return f"{self.product.name} in {self.inventory.location}"
