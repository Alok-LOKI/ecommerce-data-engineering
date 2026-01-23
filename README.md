# E-commerce Data Engineering Project

## Overview
This project demonstrates an end-to-end Data Engineering solution for an E-commerce platform.
It covers database design, SQL implementation, and REST API integration using industry-standard tools.

The project was developed as part of an academic Data Engineering assignment and reflects real-world
data modeling and API practices.

---

## Tech Stack
- Database: PostgreSQL (Supabase)
- Data Modeling: ERD (dbdiagram.io)
- API Layer: Supabase REST API
- API Testing: Postman
- Language: SQL
- Data Format: JSON

---

## Database Design (ERD)
The database consists of the following entities:
- Customers
- Categories
- Suppliers
- Products
- Orders
- Order Items
- Payments

Key relationships:
- One-to-Many: Customers to Orders
- One-to-Many: Categories to Products
- One-to-Many: Suppliers to Products
- Many-to-Many: Orders and Products (resolved using Order Items)
- One-to-One: Orders to Payments

ERD diagrams are available in the erd folder.

---

## Database Implementation
The schema was implemented in PostgreSQL using Supabase.
SQL Data Definition Language statements were used to create all tables with appropriate constraints.
Foreign keys were applied to maintain referential integrity.
Sample data was inserted to simulate real-world e-commerce transactions.

Files:
- database/schema.sql
- sql_queries/queries.sql

---

## REST API Implementation
The database was exposed using Supabase REST APIs.
A total of 20 REST endpoints were implemented to perform CRUD operations.
Postman was used to test all endpoints.
Authentication was handled using the Supabase publishable anon API key.

Postman collection:
- rest_api/Ecommerce_Postman_20_Requests.json

---

## Documentation
Detailed project documentation is available in:
- documentation/Data_Engineering_Ecommerce_Assignment.pdf

---

## Team Contribution
This project was completed as a three-member team:
- ERD and data modeling
- Database and SQL implementation
- REST API development and testing

---

## Outcome
This project demonstrates practical experience in relational data modeling,
SQL development, and REST API integration, following industry best practices.
