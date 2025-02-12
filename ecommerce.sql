-- Project Objective: Create a simple eCommerce system to manage products, customers, and orders.
-- Requirements:

-- Database Name: eCommerceDB

-- Tables:
-- Products: product_id (Primary Key), name, description, price, stock_quantity

-- Customers: customer_id (Primary Key), first_name, last_name, email, phone_number, address

-- Orders: order_id (Primary Key), customer_id (Foreign Key referencing Customers.customer_id)
-- order_date, status

-- OrderItems: order_item_id (Primary Key), order_id (Foreign Key referencing Orders.order_id)
-- product_id (Foreign Key referencing Products.product_id), quantity, price

Create database eCommerceDB;
use eCommerceDB;

drop table Products;

CREATE TABLE Products(
product_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY, -- attribute
p_name varchar(100) not null,
p_description varchar(255) not null,
Price decimal not null,
Stock_quantity int not null default 0
 );
ALTER TABLE Products 
MODIFY COLUMN Price Decimal(15,2) DEFAULT 0.00;
 
 desc Products;
 drop table Customers;
 
CREATE TABLE Customers(
customer_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY, 
First_name varchar(100) not null,
Last_name varchar(100) not null,
Email decimal not null unique,
Phone_number int ,
Address varchar(255) 
 ); 

CREATE TABLE Orders(
order_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY, 
customer_id INT,
order_date Date not null,
status varchar(15),
constraint customer_id foreign key(customer_id) references Customers(customer_id) on delete cascade on update cascade
 ); 

CREATE TABLE OrderItems (
order_item_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
order_id INT,
product_id INT, 
quantity INT,
price Decimal(15,2),
constraint order_id foreign key(order_id) references Orders(order_id) on delete cascade on update cascade,
constraint product_id foreign key(product_id) references Products(product_id) on delete cascade on update cascade 
);

SET @varA = 0;
SET @varB = IF (@varA < 1, 1, @varA);
select @varB;
 