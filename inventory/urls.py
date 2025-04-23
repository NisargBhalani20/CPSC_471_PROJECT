from django.urls import path
from . import views

urlpatterns = [
    path('', views.login_view, name='login'),
    path('home/', views.home, name='home'),
    path('logout/', views.logout_view, name='logout'),
    path('place-order/', views.place_order, name='place_order'),
    path('orders/', views.order_list, name='order_list'),
    path('orders/<int:order_id>/update-status/', views.update_order_status, name='update_order_status'),
    path('products/', views.product_list, name='product_list'),
    path('products/add/', views.add_product, name='add_product'),
    path('products/<int:product_id>/edit/', views.edit_product, name='edit_product'),
    path('products/<int:product_id>/delete/', views.delete_product, name='delete_product'),
    path('supplies/', views.supply_list, name='supply_list'),
    path('supplies/add/', views.add_supply, name='add_supply'),
    path('supplies/<int:supply_id>/edit/', views.edit_supply, name='edit_supply'),
    path('supplies/<int:supply_id>/delete/', views.delete_supply, name='delete_supply'),
    path('suppliers/', views.supplier_list, name='supplier_list'),
    path('suppliers/add/', views.add_supplier, name='add_supplier'),
    path('suppliers/<int:supplier_id>/edit/', views.edit_supplier, name='edit_supplier'),
    path('suppliers/<int:supplier_id>/delete/', views.delete_supplier, name='delete_supplier'),
    path('inventory/', views.inventory_list, name='inventory_list'),
    path('inventory/add/', views.add_inventory, name='add_inventory'),
    path('inventory/<int:inventory_id>/edit/', views.edit_inventory, name='edit_inventory'),
    path('inventory/<int:inventory_id>/delete/', views.delete_inventory, name='delete_inventory'),
    path('inventory/<int:inventory_id>/products/', views.view_inventory_products, name='view_inventory_products'),
]
