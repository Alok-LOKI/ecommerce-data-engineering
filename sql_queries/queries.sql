-- 1 Retrieve all customers

SELECT * FROM customers;

-- 2 List all products sorted by price (highest first)

SELECT * FROM products ORDER BY price DESC;

-- 3 Get all products with their category names

SELECT p.product_name, c.category_name FROM products p JOIN categories c ON p.category_id = c.category_id;

-- 4 Get all products with supplier information

SELECT p.product_name, s.supplier_name FROM products p JOIN suppliers s ON p.supplier_id = s.supplier_id;

-- 5 Count total number of customers

SELECT COUNT(*) AS total_customers FROM customers;

-- 6 Total number of orders per customer

SELECT c.full_name, COUNT(o.order_id) AS total_orders FROM customers c JOIN orders o ON c.customer_id = o.customer_id GROUP BY c.full_name;

-- 7 Average price of all products

SELECT AVG(price) AS average_product_price FROM products;

-- 8 Total quantity of items per order

SELECT order_id, SUM(quantity) AS total_items
FROM order_items
GROUP BY order_id;

-- 9 Orders with customer names and status

SELECT o.order_id, c.full_name, o.status
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id;

-- 10 Orders that have no payment record

SELECT o.order_id
FROM orders o LEFT JOIN payments p ON o.order_id = p.order_id WHERE p.order_id IS NULL;

-- 11 Total revenue generated from all orders

SELECT SUM(p.price * oi.quantity) AS total_revenue FROM order_items oi JOIN products p ON oi.product_id = p.product_id;

-- 12 Products with low stock (less than 20)

SELECT product_name, stock FROM products WHERE stock < 20;

-- 13 Number of products in each category

SELECT c.category_name, COUNT(p.product_id) AS total_products FROM categories c LEFT JOIN products p ON c.category_id = p.category_id GROUP BY c.category_name;

-- 14 Customers who placed completed orders

SELECT DISTINCT c.full_name FROM customers c JOIN orders o ON c.customer_id = o.customer_id WHERE o.status = 'completed';

-- 15 Payment details with customer name

SELECT c.full_name, p.payment_method, p.payment_status FROM payments p JOIN orders o ON p.order_id = o.order_id JOIN customers c ON o.customer_id = c.customer_id;



