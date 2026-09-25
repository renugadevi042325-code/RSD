
USE JUMPMAN;


-- =========================================================
-- DROP PAYMENT TABLE IF IT ALREADY EXISTS
-- =========================================================

DROP TABLE IF EXISTS Payment;


-- =========================================================
-- CREATE PAYMENT TABLE
-- =========================================================

CREATE TABLE Payment
(
    PaymentID INT PRIMARY KEY,
    OrderID INT,
    PaymentMode VARCHAR(20),
    PaymentDate DATE,
    PaymentAmount DECIMAL(10,2),
    PaymentStatus VARCHAR(20),

    FOREIGN KEY (OrderID)
        REFERENCES Orders(OrderID)
);


-- =========================================================
-- INSERT PAYMENT DATA
-- =========================================================

INSERT INTO Payment
(PaymentID, OrderID, PaymentMode, PaymentDate, PaymentAmount, PaymentStatus)
VALUES
(601, 501, 'UPI',  '2026-09-01', 360.00,  'SUCCESSFUL'),
(602, 502, 'CARD', '2026-09-02', 750.00,  'SUCCESSFUL'),
(603, 503, 'CASH', '2026-09-03', 600.00,  'FAILED'),
(604, 504, 'UPI',  '2026-09-04', 900.00,  'SUCCESSFUL'),
(605, 505, 'CARD', '2026-09-05', 400.00,  'SUCCESSFUL'),
(606, 506, 'CASH', '2026-09-06', 1200.00, 'SUCCESSFUL'),
(607, 507, 'UPI',  '2026-09-07', 280.00,  'FAILED'),
(608, 508, 'CARD', '2026-09-08', 800.00,  'SUCCESSFUL'),
(609, 509, 'CASH', '2026-09-09', 540.00,  'SUCCESSFUL'),
(610, 510, 'UPI',  '2026-09-10', 950.00,  'SUCCESSFUL');


-- =========================================================
-- DISPLAY ALL PAYMENTS
-- =========================================================

SELECT *
FROM Payment;


-- =========================================================
-- UPDATE PAYMENT STATUS
-- =========================================================

UPDATE Payment
SET PaymentStatus = 'SUCCESSFUL'
WHERE PaymentID = 603;


UPDATE Payment
SET PaymentStatus = 'SUCCESSFUL'
WHERE PaymentID = 607;


-- =========================================================
-- DISPLAY UPDATED PAYMENTS
-- =========================================================

SELECT *
FROM Payment
WHERE PaymentID IN (603, 607);


-- =========================================================
-- DISPLAY SUCCESSFUL PAYMENTS
-- =========================================================

SELECT *
FROM Payment
WHERE PaymentStatus = 'SUCCESSFUL';


-- =========================================================
-- DISPLAY FAILED PAYMENTS
-- =========================================================

SELECT *
FROM Payment
WHERE PaymentStatus = 'FAILED';


-- =========================================================
-- DISPLAY UPI PAYMENTS
-- =========================================================

SELECT *
FROM Payment
WHERE PaymentMode = 'UPI';


-- =========================================================
-- DISPLAY CARD PAYMENTS
-- =========================================================

SELECT *
FROM Payment
WHERE PaymentMode = 'CARD';


-- =========================================================
-- DISPLAY CASH PAYMENTS
-- =========================================================

SELECT *
FROM Payment
WHERE PaymentMode = 'CASH';


-- =========================================================
-- NUMBER OF TRANSACTIONS IN EACH PAYMENT MODE
-- =========================================================

SELECT
    PaymentMode,
    COUNT(*) AS NumberOfTransactions
FROM Payment
GROUP BY PaymentMode;


-- =========================================================
-- TOTAL SUCCESSFUL AMOUNT RECEIVED BY PAYMENT MODE
-- =========================================================

SELECT
    PaymentMode,
    SUM(PaymentAmount) AS TotalAmountReceived
FROM Payment
WHERE PaymentStatus = 'SUCCESSFUL'
GROUP BY PaymentMode;


-- =========================================================
-- TOTAL SUCCESSFUL PAYMENT AMOUNT
-- =========================================================

SELECT
    SUM(PaymentAmount) AS TotalSuccessfulAmount
FROM Payment
WHERE PaymentStatus = 'SUCCESSFUL';


-- =========================================================
-- DISPLAY PAYMENT DETAILS WITH ORDER INFORMATION
-- =========================================================

SELECT
    Payment.PaymentID,
    Payment.OrderID,
    Orders.CustomerName,
    Orders.OrderDate,
    Payment.PaymentMode,
    Payment.PaymentDate,
    Payment.PaymentAmount,
    Payment.PaymentStatus
FROM Payment
INNER JOIN Orders
ON Payment.OrderID = Orders.OrderID;


-- =========================================================
-- DISPLAY SUCCESSFUL PAYMENTS WITH CUSTOMER NAME
-- =========================================================

SELECT
    Payment.PaymentID,
    Orders.CustomerName,
    Payment.PaymentMode,
    Payment.PaymentAmount,
    Payment.PaymentStatus
FROM Payment
INNER JOIN Orders
ON Payment.OrderID = Orders.OrderID
WHERE Payment.PaymentStatus = 'SUCCESSFUL';

