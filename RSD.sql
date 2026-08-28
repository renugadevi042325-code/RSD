CREATE DATABASE FoodOrderingDB;
USE FoodOrderingDB;

-- 1. Customer Table
CREATE TABLE Customer (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    mobile VARCHAR(15),
    password VARCHAR(100) NOT NULL,
    address VARCHAR(255)
);

-- 2. Restaurant Table
CREATE TABLE Restaurant (
    restaurant_id INT PRIMARY KEY AUTO_INCREMENT,
    restaurant_name VARCHAR(100) NOT NULL,
    phone VARCHAR(15),
    address VARCHAR(255),
    opening_time TIME,
    closing_time TIME
);

-- 3. Menu Table
CREATE TABLE Menu (
    food_id INT PRIMARY KEY AUTO_INCREMENT,
    restaurant_id INT,
    food_name VARCHAR(100) NOT NULL,
    category VARCHAR(50),
    price DECIMAL(10,2) NOT NULL,
    availability VARCHAR(20) DEFAULT 'Available',

    FOREIGN KEY (restaurant_id)
    REFERENCES Restaurant(restaurant_id)
);

-- 4. Orders Table
CREATE TABLE Orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    restaurant_id INT,
    order_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    total_amount DECIMAL(10,2),
    order_status VARCHAR(30) DEFAULT 'Pending',

    FOREIGN KEY (customer_id)
    REFERENCES Customer(customer_id),

    FOREIGN KEY (restaurant_id)
    REFERENCES Restaurant(restaurant_id)
);

-- 5. Order Details Table
CREATE TABLE Order_Details (
    order_detail_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    food_id INT,
    quantity INT NOT NULL,
    price DECIMAL(10,2),

    FOREIGN KEY (order_id)
    REFERENCES Orders(order_id),

    FOREIGN KEY (food_id)
    REFERENCES Menu(food_id)
);

-- 6. Payment Table
CREATE TABLE Payment (
    payment_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    payment_method VARCHAR(30),
    transaction_id VARCHAR(100),
    payment_status VARCHAR(30),

    FOREIGN KEY (order_id)
    REFERENCES Orders(order_id)
);

-- 7. Delivery Table
CREATE TABLE Delivery (
    delivery_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    delivery_person VARCHAR(100),
    delivery_phone VARCHAR(15),
    delivery_status VARCHAR(30) DEFAULT 'Assigned',

    FOREIGN KEY (order_id)
    REFERENCES Orders(order_id)
);

-- Insert Customers
INSERT INTO Customer
(customer_name, email, mobile, password, address)
VALUES
('Renugadevi', 'renu@gmail.com', '9876543210', 'renu123', 'Chennai'),
('Anitha', 'anitha@gmail.com', '9876543211', 'anitha123', 'Tambaram');

-- Insert Restaurants
INSERT INTO Restaurant
(restaurant_name, phone, address, opening_time, closing_time)
VALUES
('Sri Krishna Restaurant', '9876500001', 'Chennai', '09:00:00', '22:00:00'),
('Food Paradise', '9876500002', 'Tambaram', '10:00:00', '23:00:00');

-- Insert Menu Items
INSERT INTO Menu
(restaurant_id, food_name, category, price, availability)
VALUES
(1, 'Chicken Biryani', 'Biryani', 180.00, 'Available'),
(1, 'Dosa', 'South Indian', 60.00, 'Available'),
(2, 'Pizza', 'Fast Food', 250.00, 'Available'),
(2, 'Burger', 'Fast Food', 150.00, 'Available');

-- Insert Orders
INSERT INTO Orders
(customer_id, restaurant_id, total_amount, order_status)
VALUES
(1, 1, 240.00, 'Preparing'),
(2, 2, 400.00, 'Out for Delivery');

-- Insert Order Details
INSERT INTO Order_Details
(order_id, food_id, quantity, price)
VALUES
(1, 1, 1, 180.00),
(1, 2, 1, 60.00),
(2, 3, 1, 250.00),
(2, 4, 1, 150.00);

-- Insert Payments
INSERT INTO Payment
(order_id, payment_method, transaction_id, payment_status)
VALUES
(1, 'UPI', 'TXN10001', 'Paid'),
(2, 'Card', 'TXN10002', 'Paid');

-- Insert Delivery Details
INSERT INTO Delivery
(order_id, delivery_person, delivery_phone, delivery_status)
VALUES
(1, 'Kumar', '9000000001', 'Assigned'),
(2, 'Arun', '9000000002', 'Out for Delivery');

-- Display Customers
SELECT * FROM Customer;

-- Display Restaurants
SELECT * FROM Restaurant;

-- Display Menu
SELECT * FROM Menu;

-- Display Orders
SELECT * FROM Orders;

-- Display Payment Details
SELECT * FROM Payment;

-- Display Delivery Details
SELECT * FROM Delivery;

-- Display Complete Order Information
SELECT
    o.order_id,
    c.customer_name,
    r.restaurant_name,
    o.total_amount,
    o.order_status,
    p.payment_method,
    p.payment_status,
    d.delivery_person,
    d.delivery_status
FROM Orders o
JOIN Customer c ON o.customer_id = c.customer_id
JOIN Restaurant r ON o.restaurant_id = r.restaurant_id
LEFT JOIN Payment p ON o.order_id = p.order_id
LEFT JOIN Delivery d ON o.order_id = d.order_id;