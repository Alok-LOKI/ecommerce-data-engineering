-- E-commerce Platform Database Schema
-- Tables: customers, categories, suppliers, products, product_categories, orders, order_items, payments

CREATE TABLE customers (
    customer_id SERIAL PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    phone VARCHAR(50),
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE categories (
    category_id SERIAL PRIMARY KEY,
    name VARCHAR(150) NOT NULL UNIQUE,
    description TEXT
);

CREATE TABLE suppliers (
    supplier_id SERIAL PRIMARY KEY,
    name VARCHAR(200) NOT NULL UNIQUE,
    contact_email VARCHAR(255) NOT NULL,
    phone VARCHAR(50)
);

CREATE TABLE products (
    product_id SERIAL PRIMARY KEY,
    name VARCHAR(200) NOT NULL,
    description TEXT,
    price NUMERIC(10,2) NOT NULL CHECK (price >= 0),
    stock INT NOT NULL DEFAULT 0,
    supplier_id INT NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_product_supplier FOREIGN KEY (supplier_id)
        REFERENCES suppliers(supplier_id) ON DELETE RESTRICT
);

-- Many-to-many products <-> categories
CREATE TABLE product_categories (
    product_id INT NOT NULL,
    category_id INT NOT NULL,
    PRIMARY KEY (product_id, category_id),
    CONSTRAINT fk_pc_product FOREIGN KEY (product_id)
        REFERENCES products(product_id) ON DELETE CASCADE,
    CONSTRAINT fk_pc_category FOREIGN KEY (category_id)
        REFERENCES categories(category_id) ON DELETE CASCADE
);

CREATE TABLE orders (
    order_id SERIAL PRIMARY KEY,
    customer_id INT NOT NULL,
    order_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    status VARCHAR(50) NOT NULL DEFAULT 'pending',
    total_amount NUMERIC(10,2) NOT NULL CHECK (total_amount >= 0),
    CONSTRAINT fk_order_customer FOREIGN KEY (customer_id)
        REFERENCES customers(customer_id) ON DELETE RESTRICT
);

CREATE TABLE order_items (
    order_item_id SERIAL PRIMARY KEY,
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL CHECK (quantity > 0),
    unit_price NUMERIC(10,2) NOT NULL CHECK (unit_price >= 0),
    CONSTRAINT fk_oi_order FOREIGN KEY (order_id)
        REFERENCES orders(order_id) ON DELETE CASCADE,
    CONSTRAINT fk_oi_product FOREIGN KEY (product_id)
        REFERENCES products(product_id) ON DELETE RESTRICT
);

CREATE TABLE payments (
    payment_id SERIAL PRIMARY KEY,
    order_id INT NOT NULL UNIQUE,
    payment_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    method VARCHAR(50) NOT NULL,
    amount NUMERIC(10,2) NOT NULL CHECK (amount >= 0),
    CONSTRAINT fk_payment_order FOREIGN KEY (order_id)
        REFERENCES orders(order_id) ON DELETE CASCADE
);

-- Insert synthetic data
INSERT INTO customers (first_name, last_name, email, phone) VALUES
('Alice','Khan','alice@example.com','+49 1111'),
('Bob','Meyer','bob@example.com','+49 2222'),
('Chris','Singh','chris@example.com','+49 3333'),
('Diana','Lopez','diana@example.com','+49 4444'),
('Eva','Rossi','eva@example.com','+49 5555');

INSERT INTO categories (name, description) VALUES
('Electronics','Devices and gadgets'),
('Books','Printed and digital books'),
('Clothing','Apparel and accessories'),
('Home','Home and kitchen items'),
('Sports','Sports and outdoor gear');

INSERT INTO suppliers (name, contact_email, phone) VALUES
('TechSource GmbH','contact@techsource.de','+49 6000'),
('Paper&Ink','info@paperink.de','+49 7000'),
('FitLife Distribution','hello@fitlife.de','+49 8000');

INSERT INTO products (name, description, price, stock, supplier_id) VALUES
('Smartphone X','5G smartphone',699.99,20,1),
('Wireless Headphones','Noise cancelling',149.99,50,1),
('Python Programming','Programming book',39.99,100,2),
('Running Shoes','Lightweight shoes',89.99,35,3),
('Yoga Mat','Non-slip',24.99,60,3),
('Coffee Maker','Drip coffee machine',129.99,15,1),
('Desk Lamp','LED lamp',29.99,40,1),
('Fiction Novel','Bestseller novel',19.99,120,2);

-- Map products to categories
INSERT INTO product_categories (product_id, category_id) VALUES
(1,1),
(2,1),
(3,2),
(4,5),
(5,5),
(6,1),
(7,4),
(8,2);

-- Create some orders and items
INSERT INTO orders (customer_id, status, total_amount) VALUES
(1,'completed',849.98),
(2,'completed',109.98),
(3,'pending',149.99),
(4,'shipped',129.99),
(5,'completed',159.98);

INSERT INTO order_items (order_id, product_id, quantity, unit_price) VALUES
(1,1,1,699.99),
(1,2,1,149.99),
(2,3,1,39.99),
(2,8,1,19.99),
(3,2,1,149.99),
(4,6,1,129.99),
(5,4,1,89.99),
(5,5,1,24.99),
(5,7,1,29.99);

INSERT INTO payments (order_id, method, amount) VALUES
(1,'credit_card',849.98),
(2,'paypal',109.98),
(4,'credit_card',129.99),
(5,'bank_transfer',159.98);