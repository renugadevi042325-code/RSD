
USE JUMPMAN;


-- =========================================================
-- REMOVE OLD ORDER TABLES
-- =========================================================

DROP TABLE IF EXISTS Order_Details;
DROP TABLE IF EXISTS Orders;


-- =========================================================
-- CREATE ORDERS TABLE
-- =========================================================

CREATE TABLE Orders
(
    OrderID INT PRIMARY KEY,
    CustomerName VARCHAR(50),
    OrderDate DATE,
    TotalAmount DECIMAL(10,2),
    OrderStatus VARCHAR(30)
);


-- =========================================================
-- CREATE ORDER DETAILS TABLE
-- =========================================================

CREATE TABLE Order_Details
(
    OrderDetailID INT PRIMARY KEY,
    OrderID INT,
    MenuItemID INT,
    Quantity INT,
    UnitPrice DECIMAL(10,2),

    FOREIGN KEY (OrderID)
        REFERENCES Orders(OrderID),

    FOREIGN KEY (MenuItemID)
        REFERENCES MenuItem(MenuItemID)
);


-- =========================================================
-- INSERT ORDERS
-- =========================================================

INSERT INTO Orders
(OrderID, CustomerName, OrderDate, TotalAmount, OrderStatus)
VALUES
(501, 'ANU',     '2026-09-01', 360.00, 'Delivered'),
(502, 'RAJEE',   '2026-09-02', 750.00, 'Preparing'),
(503, 'DHIVYA',  '2026-09-03', 600.00, 'Out for Delivery'),
(504, 'POOJA',   '2026-09-04', 900.00, 'Delivered'),
(505, 'HEMA',    '2026-09-05', 400.00, 'Preparing'),
(506, 'ARUN',    '2026-09-06', 1200.00, 'Out for Delivery'),
(507, 'MEENA',   '2026-09-07', 280.00, 'Delivered'),
(508, 'KARTHIK', '2026-09-08', 800.00, 'Preparing'),
(509, 'NITHYA',  '2026-09-09', 540.00, 'Out for Delivery'),
(510, 'VISHAL',  '2026-09-10', 950.00, 'Delivered');


-- =========================================================
-- INSERT ORDER DETAILS
-- =========================================================

INSERT INTO Order_Details
(OrderDetailID, OrderID, MenuItemID, Quantity, UnitPrice)
VALUES
(1,  501, 301, 2, 180.00),
(2,  502, 303, 3, 250.00),
(3,  503, 304, 4, 150.00),
(4,  504, 305, 5, 180.00),
(5,  505, 306, 4, 100.00),
(6,  506, 309, 4, 300.00),
(7,  507, 308, 2, 140.00),
(8,  508, 310, 4, 200.00),
(9,  509, 313, 3, 180.00),
(10, 510, 324, 5, 190.00);


-- =========================================================
-- DISPLAY ALL ORDERS
-- =========================================================

SELECT *
FROM Orders;


-- =========================================================
-- DISPLAY ALL ORDER DETAILS
-- =========================================================

SELECT *
FROM Order_Details;


-- =========================================================
-- UPDATE ORDER 502
-- =========================================================

UPDATE Orders
SET OrderStatus = 'Out for Delivery'
WHERE OrderID = 502;


-- =========================================================
-- UPDATE ORDER 503
-- =========================================================

UPDATE Orders
SET OrderStatus = 'Delivered'
WHERE OrderID = 503;


-- =========================================================
-- DISPLAY UPDATED ORDERS
-- =========================================================

SELECT *
FROM Orders;


-- =========================================================
-- DISPLAY ORDERS BY CUSTOMER AND DATE
-- =========================================================

SELECT *
FROM Orders
ORDER BY CustomerName, OrderDate;


-- =========================================================
-- DISPLAY ORDERS OF ANU
-- =========================================================

SELECT *
FROM Orders
WHERE CustomerName = 'ANU'
ORDER BY OrderDate;


-- =========================================================
-- DISPLAY PREPARING ORDERS
-- =========================================================

SELECT *
FROM Orders
WHERE OrderStatus = 'Preparing';


-- =========================================================
-- DISPLAY OUT FOR DELIVERY ORDERS
-- =========================================================

SELECT *
FROM Orders
WHERE OrderStatus = 'Out for Delivery';


-- =========================================================
-- DISPLAY DELIVERED ORDERS
-- =========================================================

SELECT *
FROM Orders
WHERE OrderStatus = 'Delivered';


-- =========================================================
-- COUNT ORDERS FOR EACH CUSTOMER
-- =========================================================

SELECT
    CustomerName,
    COUNT(*) AS TotalOrders
FROM Orders
GROUP BY CustomerName;


-- =========================================================
-- TOTAL AMOUNT SPENT BY EACH CUSTOMER
-- =========================================================

SELECT
    CustomerName,
    SUM(TotalAmount) AS TotalSpent
FROM Orders
GROUP BY CustomerName;


-- =========================================================
-- DISPLAY DETAILS OF ORDER 501
-- =========================================================

SELECT *
FROM Order_Details
WHERE OrderID = 501;


-- =========================================================
-- DISPLAY ORDERS CONTAINING MENU ITEM 301
-- =========================================================

SELECT *
FROM Order_Details
WHERE MenuItemID = 301;


-- =========================================================
-- CALCULATE TOTAL FOR EACH ORDER
-- =========================================================

SELECT
    OrderID,
    SUM(Quantity * UnitPrice) AS OrderTotal
FROM Order_Details
GROUP BY OrderID;


-- =========================================================
-- COMPARE ORDER TOTAL WITH STORED TOTAL
-- =========================================================

SELECT
    O.OrderID,
    O.CustomerName,
    O.TotalAmount AS StoredTotal,
    SUM(OD.Quantity * OD.UnitPrice) AS CalculatedTotal
FROM Orders O
INNER JOIN Order_Details OD
    ON O.OrderID = OD.OrderID
GROUP BY
    O.OrderID,
    O.CustomerName,
    O.TotalAmount;


-- =========================================================
-- DISPLAY ORDER AND CUSTOMER DETAILS
-- =========================================================

SELECT
    O.OrderID,
    O.CustomerName,
    O.OrderDate,
    O.TotalAmount,
    O.OrderStatus,
    OD.MenuItemID,
    OD.Quantity,
    OD.UnitPrice
FROM Orders O
INNER JOIN Order_Details OD
    ON O.OrderID = OD.OrderID;


-- =========================================================
-- DISPLAY FOOD NAME WITH ORDER DETAILS
-- =========================================================

SELECT
    O.OrderID,
    O.CustomerName,
    M.FoodName,
    OD.Quantity,
    OD.UnitPrice,
    (OD.Quantity * OD.UnitPrice) AS ItemTotal
FROM Orders O
INNER JOIN Order_Details OD
    ON O.OrderID = OD.OrderID
INNER JOIN MenuItem M
    ON OD.MenuItemID = M.MenuItemID;
