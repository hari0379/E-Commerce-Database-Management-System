create database E_Commerce;
use E_Commerce;
create table Customers (
    customer_id   int primary key,
    customer_name varchar(50) not null,
    email         varchar(80),
    phone         varchar(15),
    city          varchar(50)
);

create table Categories (
    category_id   int primary key,
    category_name varchar(50) not null
);

create table Products (
    product_id     int primary key,
    category_id    int,
    product_name   varchar(80) not null,
    price          decimal(10,2),
    stock_quantity int,
    foreign key (category_id) references Categories(category_id)
);

create table Orders (
    order_id     int primary key,
    customer_id  int,
    product_id   int,
    quantity     int,
    order_date   date,
    order_status varchar(20),
    foreign key (customer_id) references customers(customer_id),
    foreign key (product_id)  references Products(product_id)
);


create table Payments (
    payment_id    int primary key,
    order_id       int,
    payment_method varchar(30),
    payment_amount decimal(10,2),
    payment_status varchar(20),
    payment_date   date,
    foreign key (order_id) references Orders(order_id) on delete cascade);



insert into Customers values
(101,'Aarav Sharma','aarav@gmail.com','9876500001','Hyderabad'),
(102,'Bhavya Reddy','bhavya@gmail.com','9876500002','Vijayawada'),
(103,'Charan Kumar','charan@gmail.com','9876500003','Visakhapatnam'),
(104,'Divya Patel','divya@gmail.com','9876500004','Bengaluru'),
(105,'Esha Gupta','esha@gmail.com','9876500005','Chennai'),
(106,'Farhan Ali','farhan@gmail.com','9876500006','Mumbai'),
(107,'Gopi Krishna','gopi@gmail.com','9876500007','Warangal'),
(108,'Harini Rao','harini@gmail.com','9876500008','Guntur'),
(109,'Ishaan Verma','ishaan@gmail.com','9876500009','Pune'),
(110,'John Mathew','john@gmail.com','9876500010','Kochi');


insert into Categories values
(201,'Electronics'),(202,'Fashion'),(203,'Books'),(204,'Home Appliances'),(205,'Sports');


insert into Products values
(301,201,'Laptop',65000,20),
(302,201,'Smartphone',25000,40),
(303,201,'Bluetooth Speaker',3000,50),
(304,202,'Running Shoes',4500,35),
(305,202,'Backpack',1800,60),
(306,203,'Python Programming',700,100),
(307,203,'SQL Complete Guide',650,80),
(308,204,'Mixer Grinder',4200,25),
(309,204,'Air Fryer',5500,18),
(310,205,'Cricket Bat',2200,30);

insert into Orders values
(401,101,301,1,'2026-07-01','Delivered'),
(402,102,302,1,'2026-07-02','Delivered'),
(403,103,304,2,'2026-07-03','Shipped'),
(404,104,306,1,'2026-07-04','Delivered'),
(405,105,309,1,'2026-07-05','Pending'),
(406,106,303,3,'2026-07-06','Delivered'),
(407,107,307,2,'2026-07-07','Delivered'),
(408,108,305,1,'2026-07-08','Cancelled'),
(409,109,308,1,'2026-07-09','Delivered'),
(410,110,310,2,'2026-07-10','Shipped'),
(411,101,302,1,'2026-07-11','Delivered'),
(412,103,301,1,'2026-07-12','Pending');

insert into Payments values
(501,401,'UPI',65000,'Paid','2026-07-01'),
(502,402,'Credit Card',25000,'Paid','2026-07-02'),
(503,403,'Debit Card',9000,'Paid','2026-07-03'),
(504,404,'UPI',700,'Paid','2026-07-04'),
(505,405,'Net Banking',5500,'Pending','2026-07-05'),
(506,406,'UPI',9000,'Paid','2026-07-06'),
(507,407,'Credit Card',1300,'Paid','2026-07-07'),
(508,408,'Cash on Delivery',1800,'Cancelled','2026-07-08'),
(509,409,'UPI',4200,'Paid','2026-07-09'),
(510,410,'Debit Card',4400,'Paid','2026-07-10'),
(511,411,'UPI',25000,'Paid','2026-07-11'),
(512,412,'Credit Card',65000,'Pending','2026-07-12');

SELECT * from Payments; # order_id -->> same in orders,
select * from Orders;#  order_id - same in payments, Product_id -->> same in Products, customer_id -->> same in customers
select * from Products; # product_id --> same in Orders,# category_id --->> same in Categories
select  * from Categories; # category_id -->> same in products,
select * from  customers; # customer_id -->> same in Orders

# ============================================== QUESTIONS ===================================
 ##  1.Display all products along with their prices and available stock.
 select product_name,price,stock_quantity as Available_Stock from products;
## --------------------------------------------------------
## 2.Increase the price of all products in a particular category by 5%.
set sql_safe_updates = 0;
update products set price =price*1.05 where category_id= 201;
select * from products where category_id= 201 ;

## 3.Change the payment status of a pending payment to Paid.
set sql_safe_updates = 0;
update payments set payment_status ="Paid" where payment_status ="Pending";
select * from payments;

##4.Delete a cancelled order.
Delete from orders where order_status = "Cancelled";
select * from orders;

## 5.Display all customer names in uppercase and lowercase
update customers set customer_name = upper(customer_name);
select * from customers;
update customers set customer_name = lower(customer_name);
select * from customers;


## 6 Display the first five characters of each product name.
select prod_name, left(prod_name, 5)  as first_five from Products;
select * from products;

## 7.Concatenate the customer name and city.
select concat(customer_name,' ',city)  as customer_location from customers;

## 8.Replace the word Guide with Handbook in product names.
select product_name, replace(product_name,'Guide','Handbook') as New_name from products;

## 9.Display last week orders
select order_date from orders order by order_date desc limit 4 offset 1;


## 10. Find the number of days since each order was placed
select order_id,order_date, datediff(curdate(),order_date) as No_of_days from orders;

## 11. Display the payment date in DD-Mon-YYYY format.
select payment_date,payment_id, date_format (payment_date,"%d-%b-%Y") as New_date from payments;

## 12.Display the month and year of every order
select order_date,year(order_date) as Year_,month(order_date) as Month_ from orders;

## 13.Count the total number of products in each category
select Categories.category_name,count(products.product_id) as Total_No_of_Orders from Categories left join products on 
Categories.category_id =products.Category_id group by Categories.category_name;

## 14.Display the average product price for each category
select categories.category_name,avg(products.price) as Avg_Price from products  join categories on
categories.category_id = products.category_id group by categories.category_name;

## 15.Find the highest-priced product.
select product_name, price from products order by price desc limit 1;

## 16.Display the total sales amount collected through each payment method.
select payment_method,sum(payment_amount) as Total_Amount from payments where payment_status="Paid"  group by payment_method;

## 17. Find the average quantity ordered for each product.
select product_name,avg(stock_quantity) as Avg_Quantity from products group by product_name;

## 18. Display customer names, product names, and order dates
select customers.customer_name,products.product_name,orders.order_date 
from customers join orders on customers.customer_id = orders.customer_id 
join products on products.product_id = orders.product_id ;

## 19.Display customer names, ordered products, and payment status
select customers.customer_name,products.product_name,payments.payment_status from customers
 join orders on customers.customer_id = orders.customer_id
 join products on orders.product_id = products.product_id
 join payments on orders.order_id = payments.order_id;
 
 ## 20.Display customer names, product names, quantity ordered, and payment amount
 select  customers.customer_name,products.product_name,products.stock_quantity,payments.payment_amount from customers
 join orders on customers.customer_id = orders.customer_id 
 join products on orders.product_id = products.product_id
 join payments on payments.order_id = orders.order_id;
 
 ## 21.Display all products along with their category names, even if no orders have been placed for them
 select products.product_name,categories.category_name from categories right join products
 on categories.category_id = products.category_id;
		
## 22.Display all customers and their order details.======================================
select customers.customer_name,products.product_name from customers join orders
on orders.customer_id = customers.customer_id
join products on orders.product_id = orders.product_id;

## 23.Display category names, product names, customer names, and order status in a single result. =======
 select categories.category_name,products.product_name,customers.customer_name,orders.order_status from customers
 join orders on orders.customer_id = customers.customer_id 
 join products on products.product_id = orders.product_id
 join categories on categories.category_id = products.category_id;
 
 
 ## 24.Find customers whose payment amount is greater than the average payment amount
select customers.customer_name,payments.payment_amount as Grt_than_Avg_Amount from customers join orders 
on orders.customer_id=customers.customer_id 
join payments on payments.order_id =orders.order_id 
where payments.payment_amount > (select avg(payments.payment_amount) from payments);

## 25.Display the category that contains the most expensive product.
select categories.category_name,products.price from categories join products on
categories.category_id = products.category_id order by products.price desc limit 1;

## 26.Find customers who purchased the highest-priced product
select customers.customer_name, products.price as Highets_Price_Product from customers
join orders on orders.customer_id = customers.customer_id
join products on products.product_id = orders.product_id order by products.price desc limit 1;


## 27.Display products whose price is greater than the average price of all products.
select product_name,price as Grt_Avg_Price from products where
price > (select avg(price) from products);

## 28.Find customers who have never placed an order using NOT EXISTS.
select customer_name from customers left join orders on orders.customer_id =
customers.customer_id where orders.customer_id is null;
select customer_name from customers where not exists (select 1 from orders where orders.customer_id = customers.customer_id); #===========================

## 29.Create a view named Customer_Order_Details displaying customer name, product name, quantity, order date, and payment status.
create or replace view Customer_Order_Details as select customers.customer_name,products.product_name,products.stock_quantity,
orders.order_date,payments.payment_status from customers join orders on orders.customer_id = customers.customer_id
 join products on products.product_id = orders.product_id 
 join payments on orders.order_id = payments.order_id;
 select * from Customer_Order_Details;


## 30. Create another view named Category_Sales_Report displaying category name, total products sold, and total sales amount.
create  or replace view Category_Sales_Report as select categories.category_name,sum(orders.quantity) as total_products_sold,
sum(orders.quantity* products.price) as total_sales_amount from Categories join products 
on Categories.category_id = products.category_id
join orders on products.product_id = orders.product_id group by 1;
select * from Category_Sales_Report;

## 31.Retrieve records from both views.
select * from Customer_Order_Details;
select * from Category_Sales_Report;

## 32.Start a transaction. Update the stock quantity of a product. Create a SAVEPOINT.
# Then update the payment status of an order. Roll back to the savepoint. Commit
# the transaction.
start transaction;
update Products
set stock_quantity = stock_quantity - 1 where product_id = 301;
savepoint stock_updated;
update Payments set payment_status = 'Paid'where payment_id = 505;
rollback to savepoint stock_updated;
commit;

# 33. Create a stored procedure to display products whose stock quantity is below a  given value. 
# Input: stock_limit  
# Display product name, price, and stock quantity.
call e_commerce.GetLowStock(25);


#34.Create a stored procedure to find the total number of orders placed by customers from a particular city.  
# Input: city  
# Display the number of orders.
call e_commerce.Get_Order_Count_By_City('Visakhapatnam');


#35.  Create a stored procedure to display the details of a particular order.  
#• Input: order_id  
#• Display customer name, product name, quantity, order date, order status, and payment status.
call e_commerce.Get_Order_Details(401);


#36. Create a trigger on the Products table. 
# If someone tries to set stock_quantity to a negative value, prevent the update.  
select * from e_commerce.products;
update Products set stock_quantity = -5 where product_id = 301; #quantity can't be negative
update Products set stock_quantity = 15 where product_id = 301;


#37. Create a trigger on the Orders table. 
#Whenever a new order is placed, automatically reduce the corresponding product's stock_quantity based on the ordered quantity.
select  * from e_commerce.orders;
select product_id, product_name, stock_quantity from Products where product_id = 303;
insert into Orders values (413, 102, 303, 4, '2026-07-13', 'Pending');
select product_id, product_name, stock_quantity from Products where product_id = 303;
