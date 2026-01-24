
-- E-commerce Schema
CREATE TABLE customers (
    customer_id SERIAL PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(20),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE categories (
    category_id SERIAL PRIMARY KEY,
    category_name VARCHAR(100) UNIQUE NOT NULL
);

CREATE TABLE suppliers (
    supplier_id SERIAL PRIMARY KEY,
    supplier_name VARCHAR(100) NOT NULL,
    contact_email VARCHAR(100)
);

CREATE TABLE products (
    product_id SERIAL PRIMARY KEY,
    product_name VARCHAR(150) NOT NULL,
    price NUMERIC(10,2) NOT NULL CHECK (price > 0),
    stock INT DEFAULT 0,
    category_id INT REFERENCES categories(category_id),
    supplier_id INT REFERENCES suppliers(supplier_id)
);

CREATE TABLE orders (
    order_id SERIAL PRIMARY KEY,
    customer_id INT REFERENCES customers(customer_id),
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    status VARCHAR(20) DEFAULT 'pending'
);

CREATE TABLE order_items (
    order_item_id SERIAL PRIMARY KEY,
    order_id INT REFERENCES orders(order_id),
    product_id INT REFERENCES products(product_id),
    quantity INT NOT NULL CHECK (quantity > 0)
);

CREATE TABLE payments (
    payment_id SERIAL PRIMARY KEY,
    order_id INT UNIQUE REFERENCES orders(order_id),
    payment_method VARCHAR(50),
    payment_status VARCHAR(20),
    paid_at TIMESTAMP
);

-- ===============================
-- SAMPLE DATA INSERTIONS
-- E-COMMERCE PLATFORM
-- ===============================

-- 1. CUSTOMERS
INSERT INTO customers (full_name, email, phone) VALUES
('Alice Johnson', 'alice.johnson@mail.com', '9876543210'),
('Bob Smith', 'bob.smith@mail.com', '9123456789'),
('Charlie Brown', 'charlie.brown@mail.com', '9988776655'),
('Diana Miller', 'diana.miller@mail.com', '8899776655'),
('Ethan Wilson', 'ethan.wilson@mail.com', '7766554433');

-- 2. CATEGORIES
INSERT INTO categories (category_name) VALUES
('Electronics'),
('Fashion'),
('Home Appliances'),
('Books'),
('Sports');

-- 3. SUPPLIERS
INSERT INTO suppliers (supplier_name, contact_email) VALUES
('TechSource Ltd', 'contact@techsource.com'),
('FashionHub Co', 'support@fashionhub.com'),
('HomePro Supplies', 'sales@homepro.com'),
('BookWorld Distributors', 'info@bookworld.com'),
('Sportify Traders', 'orders@sportify.com');

-- 4. PRODUCTS
INSERT INTO products (product_name, price, stock, category_id, supplier_id) VALUES
('Laptop', 850.00, 15, 1, 1),
('Smartphone', 650.00, 20, 1, 1),
('T-Shirt', 25.00, 100, 2, 2),
('Microwave Oven', 180.00, 10, 3, 3),
('Programming Book', 30.00, 40, 4, 4),
('Running Shoes', 90.00, 25, 5, 5);

-- 5. ORDERS
INSERT INTO orders (customer_id, status) VALUES
(1, 'completed'),
(2, 'pending'),
(3, 'completed'),
(4, 'cancelled'),
(5, 'completed');

-- 6. ORDER ITEMS
INSERT INTO order_items (order_id, product_id, quantity) VALUES
(1, 1, 1),
(1, 3, 2),
(2, 2, 1),
(3, 4, 1),
(3, 6, 1),
(5, 5, 2);

-- 7. PAYMENTS
INSERT INTO payments (order_id, payment_method, payment_status, paid_at) VALUES
(1, 'Credit Card', 'Paid', CURRENT_TIMESTAMP),
(3, 'UPI', 'Paid', CURRENT_TIMESTAMP),
(5, 'Debit Card', 'Paid', CURRENT_TIMESTAMP);

-- ===============================
-- END OF SAMPLE DATA
-- ===============================
