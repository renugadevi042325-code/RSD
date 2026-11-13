USE JUMPMAN;

SELECT Orders.OrderID,
       Order_Details.MenuItemID,
       Order_Details.Quantity
FROM Orders
INNER JOIN Order_Details
ON Orders.OrderID = Order_Details.OrderID;


SELECT Orders.OrderID,
       Order_Details.MenuItemID,
       Order_Details.Quantity
FROM Orders
LEFT JOIN Order_Details
ON Orders.OrderID = Order_Details.OrderID;


SELECT Orders.OrderID,
       Orders.CustomerName,
       Order_Details.MenuItemID,
       Order_Details.Quantity
FROM Orders
RIGHT JOIN Order_Details
ON Orders.OrderID = Order_Details.OrderID;


SELECT Orders.OrderID,
       Orders.TotalAmount,
       Payment.PaymentMode,
       Payment.PaymentAmount
FROM Orders
INNER JOIN Payment
ON Orders.OrderID = Payment.OrderID;


SELECT Orders.OrderID,
       Orders.TotalAmount,
       Payment.PaymentMode,
       Payment.PaymentAmount
FROM Orders
INNER JOIN Payment
ON Orders.OrderID = Payment.OrderID;


SELECT MenuItem.FoodName,
       Restaurant.RestaurantName
FROM MenuItem
INNER JOIN Restaurant
ON MenuItem.RestaurantID = Restaurant.RestaurantID;


SELECT Orders.OrderID,
       MenuItem.FoodName,
       Order_Details.Quantity,
       Payment.PaymentStatus
FROM Orders
INNER JOIN Order_Details
ON Orders.OrderID = Order_Details.OrderID
INNER JOIN MenuItem
ON Order_Details.MenuItemID = MenuItem.MenuItemID
LEFT JOIN Payment
ON Orders.OrderID = Payment.OrderID;