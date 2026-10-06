USE FOOD_ORDERING;

DROP TABLE IF EXISTS Food;

CREATE TABLE Food
(
    FoodID INT PRIMARY KEY,
    FoodName VARCHAR(100),
    Category VARCHAR(50),
    Price DECIMAL(10,2),
    Availability VARCHAR(20)
);

INSERT INTO Food VALUES
(101, 'Chicken Biryani', 'Biryani', 180, 'Available'),
(102, 'Veg Fried Rice', 'Rice', 120, 'Available'),
(103, 'Chicken Noodles', 'Noodles', 150, 'Available'),
(104, 'Paneer Butter Masala', 'Gravy', 200, 'Available'),
(105, 'Veg Pizza', 'Pizza', 250, 'Unavailable'),
(106, 'Chicken Burger', 'Burger', 160, 'Available'),
(107, 'French Fries', 'Snacks', 100, 'Available'),
(108, 'Ice Cream', 'Dessert', 80, 'Unavailable');



SELECT * FROM Food;


SELECT DISTINCT Category
FROM Food;


SELECT * FROM Food
WHERE Price > 150;


SELECT * FROM Food
ORDER BY Price DESC;