from django.contrib import admin
from .models import (
    User, BusinessOwner, Customer,
    Supplier, Product, Supply,
    Order, Shipment, Inventory,
    Contains, Delivers, ComposedOf, StoredIn
)

# 1. User Admin
@admin.register(User)
class UserAdmin(admin.ModelAdmin):
    list_display = ('user_id', 'name', 'email', 'phone', 'user_type')
    search_fields = ('name', 'email')
    list_filter = ('user_type',)

# 2. Business Owner Admin
@admin.register(BusinessOwner)
class BusinessOwnerAdmin(admin.ModelAdmin):
    list_display = ('owner',)
    search_fields = ('owner__name',)

# 3. Customer Admin
@admin.register(Customer)
class CustomerAdmin(admin.ModelAdmin):
    list_display = ('customer_id', 'name', 'phone_number')
    search_fields = ('name', 'phone_number')

# 4. Supplier Admin
@admin.register(Supplier)
class SupplierAdmin(admin.ModelAdmin):
    list_display = ('supplier_id', 'name', 'contact_info')
    search_fields = ('name',)

# 5. Product Admin
@admin.register(Product)
class ProductAdmin(admin.ModelAdmin):
    list_display = ('product_id', 'name', 'price', 'quantity', 'location')
    search_fields = ('name',)
    list_filter = ('location',)

# 6. Supply Admin
@admin.register(Supply)
class SupplyAdmin(admin.ModelAdmin):
    list_display = ('supply_id', 'name', 'cost', 'supplier')
    search_fields = ('name',)
    list_filter = ('supplier',)

# 7. Inventory Admin
@admin.register(Inventory)
class InventoryAdmin(admin.ModelAdmin):
    list_display = ('inventory_id', 'location', 'capacity')
    search_fields = ('location',)

# 8. Order Admin
@admin.register(Order)
class OrderAdmin(admin.ModelAdmin):
    list_display = ('order_id', 'order_date', 'total_amount', 'customer')
    search_fields = ('order_id', 'customer__name')
    list_filter = ('order_date',)

# 9. Shipment Admin
@admin.register(Shipment)
class ShipmentAdmin(admin.ModelAdmin):
    list_display = ('shipment_id', 'shipping_date', 'tracking_number', 'order')
    search_fields = ('tracking_number',)
    list_filter = ('shipping_date',)

# 10. Contains Admin (Intermediary)
@admin.register(Contains)
class ContainsAdmin(admin.ModelAdmin):
    list_display = ('order', 'product')

# 11. Delivers Admin (Intermediary)
@admin.register(Delivers)
class DeliversAdmin(admin.ModelAdmin):
    list_display = ('supplier', 'product')

# 12. ComposedOf Admin (Intermediary)
@admin.register(ComposedOf)
class ComposedOfAdmin(admin.ModelAdmin):
    list_display = ('supply', 'product')

# 13. StoredIn Admin (Intermediary)
@admin.register(StoredIn)
class StoredInAdmin(admin.ModelAdmin):
    list_display = ('inventory', 'product', 'quantity')
    list_filter = ('inventory',)
