from django.shortcuts import render, redirect, get_object_or_404
from django.contrib.auth.decorators import login_required
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.models import User
from django.contrib import messages
from .models import Product, Supply, Supplier, Inventory, StoredIn, Order, Customer, Contains
from .forms import ProductForm
from django.utils import timezone

# Login View
def login_view(request):
    if request.method == 'POST':
        print("Received POST request:", request.POST)  # Debug print
        username = request.POST.get('username')
        password = request.POST.get('password')
        user_type = request.POST.get('user_type')
        
        print(f"Login attempt - Type: {user_type}, Username: {username}")  # Debug print
        
        try:
            # Authenticate user regardless of type
            user = authenticate(request, username=username, password=password)
            
            if user_type == 'customer':
                print("Processing customer login")  # Debug print
                if user is not None:
                    login(request, user)
                    messages.success(request, 'Successfully logged in as customer!')
                    return redirect('place_order')
                else:
                    messages.error(request, 'Invalid username or password')
            elif user_type == 'business_owner':
                print("Processing business owner login")  # Debug print
                if user is not None and user.is_superuser:
                    login(request, user)
                    messages.success(request, 'Successfully logged in as business owner!')
                    return redirect('home')
                else:
                    messages.error(request, 'Invalid credentials or insufficient permissions')
            else:
                print(f"Invalid user type: {user_type}")  # Debug print
                messages.error(request, 'Please select a valid user type')
        except Exception as e:
            print(f"Login error: {str(e)}")  # Debug print
            messages.error(request, 'An error occurred during login')
    
    return render(request, 'inventory/login.html')

# Logout View
def logout_view(request):
    logout(request)
    return redirect('login')

# Home Page View
@login_required(login_url='login')
def home(request):
    # Get products with quantity less than 100
    low_stock_products = Product.objects.filter(quantity__lt=100)
    
    # If there are low stock products, add a message if not already present
    if low_stock_products.exists():
        # Check if there's already a low stock message
        has_low_stock_message = False
        for message in messages.get_messages(request):
            if 'low on stock' in str(message):
                has_low_stock_message = True
                break
        
        if not has_low_stock_message:
            messages.warning(request, 'Some products are running low on stock!')
    
    return render(request, 'inventory/home.html', {
        'low_stock_products': low_stock_products,
        'messages': messages.get_messages(request)
    })

# List All Products
@login_required(login_url='login')
def product_list(request):
    products = Product.objects.all()
    return render(request, 'inventory/product_list.html', {'products': products})

# Add New Product
@login_required(login_url='login')
def add_product(request):
    if request.method == 'POST':
        name = request.POST.get('name')
        description = request.POST.get('description')
        price = request.POST.get('price')
        quantity = request.POST.get('quantity')
        location = request.POST.get('location')
        
        # Create new product
        Product.objects.create(
            name=name,
            description=description,
            price=price,
            quantity=quantity,
            location=location
        )
        messages.success(request, f'Product {name} added successfully!')
        return redirect('product_list')
    
    return render(request, 'inventory/add_product.html')

# Edit Existing Product
@login_required(login_url='login')
def edit_product(request, product_id):
    product = get_object_or_404(Product, pk=product_id)
    if request.method == 'POST':
        form = ProductForm(request.POST, instance=product)
        if form.is_valid():
            form.save()
            messages.success(request, 'Product updated successfully!')
            return redirect('product_list')
    else:
        form = ProductForm(instance=product)
    
    return render(request, 'inventory/edit_product.html', {
        'product': product,
        'form': form
    })

# Delete Product
@login_required(login_url='login')
def delete_product(request, product_id):
    product = get_object_or_404(Product, pk=product_id)
    if request.method == 'POST':
        product.delete()
        messages.success(request, 'Product deleted successfully!')
        return redirect('product_list')
    return render(request, 'inventory/delete_product.html', {'product': product})

# Supply Management Views
@login_required(login_url='login')
def supply_list(request):
    supplies = Supply.objects.all()
    suppliers = Supplier.objects.all()
    return render(request, 'inventory/supply_management.html', {
        'supplies': supplies,
        'suppliers': suppliers
    })

@login_required(login_url='login')
def add_supply(request):
    if request.method == 'POST':
        name = request.POST.get('name')
        cost = request.POST.get('cost')
        supplier_id = request.POST.get('supplier')
        
        supplier = get_object_or_404(Supplier, pk=supplier_id)
        
        Supply.objects.create(
            name=name,
            cost=cost,
            supplier=supplier
        )
        messages.success(request, f'Supply {name} added successfully!')
        return redirect('supply_list')
    
    return redirect('supply_list')

@login_required(login_url='login')
def edit_supply(request, supply_id):
    supply = get_object_or_404(Supply, pk=supply_id)
    suppliers = Supplier.objects.all()
    
    if request.method == 'POST':
        supply.name = request.POST.get('name')
        supply.cost = request.POST.get('cost')
        supplier_id = request.POST.get('supplier')
        supply.supplier = get_object_or_404(Supplier, pk=supplier_id)
        supply.save()
        messages.success(request, 'Supply updated successfully!')
        return redirect('supply_list')
    
    return render(request, 'inventory/edit_supply.html', {
        'supply': supply,
        'suppliers': suppliers
    })

@login_required(login_url='login')
def delete_supply(request, supply_id):
    supply = get_object_or_404(Supply, pk=supply_id)
    if request.method == 'POST':
        supply.delete()
        messages.success(request, 'Supply deleted successfully!')
        return redirect('supply_list')
    return render(request, 'inventory/delete_supply.html', {'supply': supply})

@login_required
def supplier_list(request):
    suppliers = Supplier.objects.all()
    return render(request, 'inventory/suppliers.html', {'suppliers': suppliers})

@login_required
def add_supplier(request):
    if request.method == 'POST':
        name = request.POST.get('name')
        contact_info = request.POST.get('contact_info')
        
        supplier = Supplier.objects.create(
            name=name,
            contact_info=contact_info
        )
        messages.success(request, 'Supplier added successfully!')
        return redirect('supplier_list')
    
    return render(request, 'inventory/suppliers.html')

@login_required
def edit_supplier(request, supplier_id):
    supplier = get_object_or_404(Supplier, supplier_id=supplier_id)
    
    if request.method == 'POST':
        supplier.name = request.POST.get('name')
        supplier.contact_info = request.POST.get('contact_info')
        supplier.save()
        messages.success(request, 'Supplier updated successfully!')
        return redirect('supplier_list')
    
    return render(request, 'inventory/edit_supplier.html', {'supplier': supplier})

@login_required
def delete_supplier(request, supplier_id):
    supplier = get_object_or_404(Supplier, supplier_id=supplier_id)
    
    if request.method == 'POST':
        supplier.delete()
        messages.success(request, 'Supplier deleted successfully!')
        return redirect('supplier_list')
    
    return render(request, 'inventory/delete_supplier.html', {'supplier': supplier})

@login_required
def inventory_list(request):
    inventories = Inventory.objects.all().prefetch_related(
        'storedin_set',
        'storedin_set__product'
    )
    return render(request, 'inventory/inventory_list.html', {'inventories': inventories})

@login_required
def add_inventory(request):
    if request.method == 'POST':
        location = request.POST.get('location')
        capacity = request.POST.get('capacity')
        
        Inventory.objects.create(
            location=location,
            capacity=capacity
        )
        messages.success(request, f'Inventory location {location} added successfully!')
        return redirect('inventory_list')
    
    return render(request, 'inventory/inventory_list.html')

@login_required
def edit_inventory(request, inventory_id):
    inventory = get_object_or_404(Inventory, pk=inventory_id)
    
    if request.method == 'POST':
        location = request.POST.get('location')
        capacity = request.POST.get('capacity')
        
        inventory.location = location
        inventory.capacity = capacity
        inventory.save()
        
        messages.success(request, 'Inventory location updated successfully!')
        return redirect('inventory_list')
    
    return render(request, 'inventory/edit_inventory.html', {'inventory': inventory})

@login_required
def delete_inventory(request, inventory_id):
    inventory = get_object_or_404(Inventory, pk=inventory_id)
    
    if request.method == 'POST':
        inventory.delete()
        messages.success(request, 'Inventory location deleted successfully!')
        return redirect('inventory_list')
    
    return render(request, 'inventory/delete_inventory.html', {'inventory': inventory})

@login_required
def view_inventory_products(request, inventory_id):
    inventory = get_object_or_404(Inventory, pk=inventory_id)
    stored_products = StoredIn.objects.filter(inventory=inventory)
    return render(request, 'inventory/inventory_products.html', {
        'inventory': inventory,
        'stored_products': stored_products
    })

# Place Order View (for customers)
def place_order(request):
    if request.method == 'POST':
        try:
            print("\n=== Processing Order Placement ===")
            print("Received POST request with data:", request.POST)
            customer_name = request.POST.get('customer_name')
            phone_number = request.POST.get('phone_number')
            product_ids = request.POST.getlist('product_ids')
            quantities = request.POST.getlist('quantities')
            
            print(f"Customer Name: {customer_name}")
            print(f"Phone Number: {phone_number}")
            print(f"Product IDs: {product_ids}")
            print(f"Quantities: {quantities}")
            
            if not customer_name or not phone_number or not product_ids or not quantities:
                messages.error(request, 'Missing required fields')
                return render(request, 'inventory/place_order.html', {'products': Product.objects.filter(quantity__gt=0)})
            
            # Filter out empty product IDs and their quantities
            valid_orders = [(pid, qty) for pid, qty in zip(product_ids, quantities) if pid.strip()]
            if not valid_orders:
                messages.error(request, 'No valid products selected')
                return render(request, 'inventory/place_order.html', {'products': Product.objects.filter(quantity__gt=0)})
            
            # Create customer
            customer = Customer.objects.create(
                name=customer_name,
                phone_number=phone_number
            )
            print(f"Created Customer - ID: {customer.customer_id}, Name: {customer.name}")
            
            # Calculate total amount
            total_amount = 0
            products_to_update = []
            
            for product_id, quantity in valid_orders:
                try:
                    product = Product.objects.get(pk=product_id)
                    quantity = int(quantity)
                    
                    if quantity <= 0:
                        messages.error(request, f'Invalid quantity for {product.name}')
                        customer.delete()
                        return render(request, 'inventory/place_order.html', {'products': Product.objects.filter(quantity__gt=0)})
                    
                    if quantity > product.quantity:
                        messages.error(request, f'Not enough stock for {product.name}')
                        customer.delete()
                        return render(request, 'inventory/place_order.html', {'products': Product.objects.filter(quantity__gt=0)})
                    
                    total_amount += float(product.price) * quantity
                    products_to_update.append((product, quantity))
                    print(f"Added to order - Product: {product.name}, Quantity: {quantity}, Price: ${product.price}")
                    
                except Product.DoesNotExist:
                    messages.error(request, f'Product with ID {product_id} not found')
                    customer.delete()
                    return render(request, 'inventory/place_order.html', {'products': Product.objects.filter(quantity__gt=0)})
                except ValueError:
                    messages.error(request, f'Invalid quantity value')
                    customer.delete()
                    return render(request, 'inventory/place_order.html', {'products': Product.objects.filter(quantity__gt=0)})
            
            # Create order with pending status
            order = Order.objects.create(
                order_date=timezone.now().date(),
                total_amount=total_amount,
                customer=customer,
                status='pending'  # Add status field
            )
            print(f"Created Order - ID: {order.order_id}, Total Amount: ${total_amount}")
            
            # Add products to order but don't update quantities yet
            for product, quantity in products_to_update:
                Contains.objects.create(
                    order=order,
                    product=product,
                    quantity=quantity
                )
                print(f"Added product {product.name} to order - Quantity: {quantity}")
            
            messages.success(request, 'Your order has been successfully placed! It will be processed after approval.')
            print("=== Order Processing Complete ===\n")
            return redirect('login')
            
        except Exception as e:
            print(f"Error processing order: {str(e)}")
            import traceback
            traceback.print_exc()
            messages.error(request, 'There was an error processing your order')
            return render(request, 'inventory/place_order.html', {'products': Product.objects.filter(quantity__gt=0)})
    
    products = Product.objects.filter(quantity__gt=0)
    return render(request, 'inventory/place_order.html', {'products': products})

# Order List View
@login_required(login_url='login')
def order_list(request):
    print("\n=== Fetching Orders ===")
    orders = Order.objects.all().select_related('customer').prefetch_related(
        'contains_set',
        'contains_set__product'
    ).order_by('-order_date')
    
    print(f"Total orders found: {orders.count()}")
    for order in orders:
        print(f"\nOrder #{order.order_id}:")
        print(f"Date: {order.order_date}")
        print(f"Customer: {order.customer.name} (Phone: {order.customer.phone_number})")
        print(f"Total Amount: ${order.total_amount}")
        print("Products:")
        for item in order.contains_set.all():
            print(f"- {item.product.name}: {item.quantity} x ${item.product.price}")
    print("=== End of Orders ===\n")
    
    return render(request, 'inventory/order_list.html', {'orders': orders})

@login_required(login_url='login')
def update_order_status(request, order_id):
    if request.method == 'POST':
        order = get_object_or_404(Order, order_id=order_id)
        action = request.POST.get('action')
        
        if action == 'approve':
            # Only update product quantities when approving
            if order.status == 'pending':
                order.status = 'approved'
                order.save()
                
                # Update product quantities
                for item in order.contains_set.all():
                    product = item.product
                    product.quantity -= item.quantity
                    product.save()
                    
                    # Check if product is now low on stock
                    if product.quantity < 100:
                        messages.warning(request, f'Product "{product.name}" is now low on stock!')
                
                messages.success(request, f'Order #{order.order_id} has been approved')
            else:
                messages.error(request, 'This order has already been processed')
                
        elif action == 'deny':
            if order.status == 'pending':
                order.status = 'denied'
                order.save()
                messages.success(request, f'Order #{order.order_id} has been denied')
            else:
                messages.error(request, 'This order has already been processed')
        
        # Redirect to home page to show updated low stock alerts
        return redirect('home')
    
    return redirect('home')
