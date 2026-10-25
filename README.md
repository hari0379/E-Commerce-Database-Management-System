# E-Commerce-Database-Management-System
A MySQL-based E-Commerce Database Management System to manage customers, products, categories, orders, and payments using SQL queries, joins, views, stored procedures, and triggers. 2. README.md file

This project demonstrates how relational databases and SQL queries can be used to store, retrieve, update, and analyze e-commerce data.

## 🎯 Objectives

- Store and manage customer information.
- Organize products into different categories.
- Maintain product prices and stock quantities.
- Record customer orders and order statuses.
- Track payment methods, amounts, and payment statuses.
- Generate sales reports and analyze product information.
- Maintain data consistency using database constraints and triggers.

## 🛠️ Technologies Used

- **Database:** MySQL
- **Language:** SQL
- **Tools:** MySQL Workbench

## 🗂️ Database Tables

The project contains five main tables:

 Customers - Stores customer details and contact information 
 Categories - Stores product category information 
 Products - Maintains product names, prices, categories, and stock 
 Orders - Records customer orders and order statuses 
 Payments - Stores payment methods, amounts, and statuses 

## ✨ Key Features

- Database creation and table management
- Data insertion, updating, and deletion
- SQL filtering and string functions
- Date and aggregate functions
- INNER JOIN, LEFT JOIN, and RIGHT JOIN operations
- Subqueries and NOT EXISTS
- Views for customer order details and category sales reports
- Transactions, SAVEPOINT, ROLLBACK, and COMMIT
- Stored procedures for low-stock products, order counts, and order details
- Triggers for stock validation and automatic inventory updates

## 📊 Reports and Analysis

The database supports queries to:

- Display product prices and available stock.
- Identify the highest-priced products.
- Calculate average prices by category.
- Find customers who have not placed orders.
- Retrieve customer purchase and payment details.
- Generate category-wise sales reports.
- Track payment status and order history.

## ⚙️ How to Run the Project

1. Install MySQL Server and MySQL Workbench.
2. Download or clone this repository.
3. Open `mysqlproject.sql` in MySQL Workbench.
4. Connect to your MySQL server.
5. Execute the SQL script to create the database, tables, and sample records.
6. Run the required SQL queries to explore the project features.

**Note:** Stored procedures and triggers must be created in the SQL script before their corresponding `CALL` statements or test queries can run. Check that all object definitions are included in the script.

## 🎓 Learning Outcomes

Through this project, I practiced relational database design, SQL query writing, table relationships, joins, subqueries, views, transactions, stored procedures, and triggers.

## 🏁 Conclusion

The E-Commerce Database Management System demonstrates how MySQL can be used to organize and manage e-commerce data efficiently. It applies SQL concepts to support inventory management, order processing, payment tracking, and sales reporting.


**Project Type:** Database Management System  
**Domain:** E-Commerce  
**Technology:** MySQL and SQL
