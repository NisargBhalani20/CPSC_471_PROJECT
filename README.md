CPSC 471 Final Project
Inventory Management System
---------------------------------------

Team Members:
1)Nisarg Bhalani
2)Paula Almeida
3)Ayushi Patil

---------------------------------------

Developed with:
- Django
- MySQL
- HTML
- CSS
- JavaScript

---------------------------------------
Setup Instructions:

1. Install required packages:
   - Make sure Python 3.x is installed.
   - Install Django:
     pip3 install django
   - Install MySQL client:
     pip3 install mysqlclient

2. .env File Config :
  - Setup the .env file for MySQL and Django based on the .env.example file
  - A Django Secret key is generated everytime a project is created
  - To generate the MySQL password, create a mySQL account and use that password


3. Import Database:
   - Start your MySQL server locally.
   - Open Terminal and login to MySQL:
     mysql -u root -p
   - Create the database (if needed):
     CREATE DATABASE inventory_db (already provided inventory_db.sql);
   - Import provided database file:
     USE inventory_db;
     SOURCE path_to_inventory_db.sql;

4. Configure MySQL Credentials:
   - Open 'inventory_management_system/settings.py'.
   - Update the DATABASES section with your MySQL username and password.

5. Run Django Migrations (if necessary):
   - Navigate to your project directory where 'manage.py' is located.
   - Run:
     python3 manage.py makemigrations
     python3 manage.py migrate

6. Start Django Server:
   - From the project folder, run:
     python3 manage.py runserver

7. Open Browser:
   - Visit this (link)[http://127.0.0.1:8000/]

---------------------------------------
Login Information:

- Superuser (Business Owner):
  Username: owner2
  Password: plumber123

- Customer Account:
  Username: customer1, customer2, customer3, customer4
  Password: customer123

---------------------------------------
Project Functionality:

- Business Owner logs in and is redirected to the Home Dashboard (Inventory, Supplies, Orders management).
- Customer logs in and is redirected to the Shop Page to place orders.
- Low stock warnings are shown for products with quantity below threshold.
- Orders placed by customers are saved and visible in Order List.
- Admin can manage products, inventory, suppliers, and shipments.

---------------------------------------
Extra Notes:

- If more Business Owners are needed, create them using:

  python3 manage.py createsuperuser

- New Products, Supplies, or Shipments can be added from the Business Owner dashboard.
- If necessary, new users and data can be created using Django Admin Panel at:
  http://127.0.0.1:8000/admin/
  
---------------------------------------
Thank you!


