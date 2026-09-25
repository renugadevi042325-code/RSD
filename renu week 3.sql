
USE JUMPMAN;

-- =========================================================
-- DROP TABLES IF THEY ALREADY EXIST
-- =========================================================

DROP TABLE IF EXISTS MenuItem;
DROP TABLE IF EXISTS Restaurant;


-- =========================================================
-- CREATE RESTAURANT TABLE
-- =========================================================

CREATE TABLE Restaurant
(
    RestaurantID INT PRIMARY KEY,
    RestaurantName VARCHAR(100),
    ContactNo VARCHAR(15),
    Email VARCHAR(100),
    Address VARCHAR(150),
    OperatingHours VARCHAR(50)
);


-- =========================================================
-- INSERT RESTAURANT DATA
-- =========================================================

INSERT INTO Restaurant
(RestaurantID, RestaurantName, ContactNo, Email, Address, OperatingHours)
VALUES
(201,'BURGER HOUSE','9876500001','burgerhouse@gmail.com','Chennai','10:00 AM - 10:00 PM'),
(202,'SPICE KITCHEN','9876500002','spicekitchen@gmail.com','Madurai','09:00 AM - 10:00 PM'),
(203,'FOOD PALACE','9876500003','foodpalace@gmail.com','Coimbatore','10:00 AM - 11:00 PM'),
(204,'TASTY BITES','9876500004','tastybites@gmail.com','Salem','09:00 AM - 10:00 PM'),
(205,'ROYAL RESTAURANT','9876500005','royalrestaurant@gmail.com','Trichy','10:00 AM - 11:00 PM'),
(206,'FOOD HUB','9876500006','foodhub@gmail.com','Chennai','10:00 AM - 10:00 PM'),
(207,'HOT AND SPICY','9876500007','hotspicy@gmail.com','Madurai','11:00 AM - 11:00 PM'),
(208,'FOOD ZONE','9876500008','foodzone@gmail.com','Coimbatore','09:00 AM - 10:00 PM'),
(209,'TASTE WORLD','9876500009','tasteworld@gmail.com','Salem','10:00 AM - 10:00 PM'),
(210,'CITY FOOD','9876500010','cityfood@gmail.com','Trichy','10:00 AM - 11:00 PM'),
(211,'CHENNAI BITES','9876500011','chennaibites@gmail.com','Chennai','09:00 AM - 10:00 PM'),
(212,'MADURAI KITCHEN','9876500012','maduraikitchen@gmail.com','Madurai','10:00 AM - 11:00 PM'),
(213,'COIMBATORE FOODS','9876500013','coimbatorefoods@gmail.com','Coimbatore','09:00 AM - 10:00 PM'),
(214,'SALEM TASTES','9876500014','salemtastes@gmail.com','Salem','10:00 AM - 10:00 PM'),
(215,'TRICHY FOODS','9876500015','trichyfoods@gmail.com','Trichy','10:00 AM - 11:00 PM'),
(216,'FOOD MART','9876500016','foodmart@gmail.com','Chennai','09:00 AM - 10:00 PM'),
(217,'TASTY MART','9876500017','tastymart@gmail.com','Madurai','10:00 AM - 10:00 PM'),
(218,'FOOD SUPPLIERS','9876500018','foodsuppliers@gmail.com','Coimbatore','09:00 AM - 10:00 PM'),
(219,'KITCHEN STORE','9876500019','kitchenstore@gmail.com','Salem','10:00 AM - 10:00 PM'),
(220,'CITY KITCHEN','9876500020','citykitchen@gmail.com','Trichy','10:00 AM - 11:00 PM'),
(221,'PREMIUM FOODS','9876500021','premiumfoods@gmail.com','Chennai','10:00 AM - 11:00 PM'),
(222,'ELITE FOODS','9876500022','elitekicks@gmail.com','Madurai','09:00 AM - 10:00 PM'),
(223,'FOOD EXPRESS','9876500023','foodexpress@gmail.com','Coimbatore','10:00 AM - 11:00 PM'),
(224,'TASTE CARE','9876500024','tastecare@gmail.com','Salem','09:00 AM - 10:00 PM'),
(225,'BEST FOODS','9876500025','bestfoods@gmail.com','Trichy','10:00 AM - 11:00 PM');


-- =========================================================
-- DISPLAY ALL RESTAURANTS
-- =========================================================

SELECT * FROM Restaurant;


-- =========================================================
-- CREATE MENU ITEM TABLE
-- =========================================================

CREATE TABLE MenuItem
(
    MenuItemID INT PRIMARY KEY,
    RestaurantID INT,
    FoodName VARCHAR(100),
    Category VARCHAR(50),
    Description VARCHAR(200),
    Price DECIMAL(10,2),
    AvailabilityStatus VARCHAR(20),
    Stock INT,

    FOREIGN KEY (RestaurantID)
    REFERENCES Restaurant(RestaurantID)
);


-- =========================================================
-- INSERT MENU ITEM DATA
-- =========================================================

INSERT INTO MenuItem
(MenuItemID, RestaurantID, FoodName, Category, Description,
 Price, AvailabilityStatus, Stock)
VALUES
(301,201,'Chicken Burger','Burger','Chicken burger with fresh vegetables',180.00,'AVAILABLE',25),
(302,202,'Chicken Biryani','Biryani','Spicy chicken biryani',220.00,'AVAILABLE',15),
(303,203,'Paneer Pizza','Pizza','Cheesy paneer pizza',250.00,'AVAILABLE',10),
(304,204,'Veg Fried Rice','Rice','Vegetable fried rice',150.00,'AVAILABLE',12),
(305,205,'Chicken Noodles','Noodles','Spicy chicken noodles',180.00,'AVAILABLE',30),
(306,206,'Masala Dosa','South Indian','Crispy masala dosa',100.00,'AVAILABLE',20),
(307,207,'Mutton Biryani','Biryani','Traditional mutton biryani',280.00,'UNAVAILABLE',0),
(308,208,'Veg Burger','Burger','Fresh vegetable burger',140.00,'AVAILABLE',18),
(309,209,'Chicken Pizza','Pizza','Chicken loaded pizza',300.00,'AVAILABLE',15),
(310,210,'Paneer Biryani','Biryani','Paneer biryani with spices',200.00,'AVAILABLE',30),
(311,211,'Chicken Shawarma','Fast Food','Chicken shawarma roll',160.00,'UNAVAILABLE',0),
(312,212,'Idli Sambar','South Indian','Soft idli with sambar',80.00,'AVAILABLE',15),
(313,213,'Veg Meals','Meals','Complete vegetarian meals',180.00,'AVAILABLE',20),
(314,214,'Chicken 65','Starters','Crispy spicy chicken',220.00,'UNAVAILABLE',0),
(315,215,'Parotta','South Indian','Layered parotta',60.00,'AVAILABLE',15),
(316,216,'Egg Fried Rice','Rice','Fried rice with egg',150.00,'AVAILABLE',12),
(317,217,'Fish Fry','Seafood','Crispy fish fry',250.00,'UNAVAILABLE',0),
(318,218,'Gobi Manchurian','Starters','Spicy cauliflower manchurian',160.00,'AVAILABLE',10),
(319,219,'Chicken Kebab','Starters','Grilled chicken kebab',240.00,'AVAILABLE',20),
(320,220,'Prawn Biryani','Biryani','Special prawn biryani',320.00,'UNAVAILABLE',0),
(321,221,'Veg Pizza','Pizza','Fresh vegetable pizza',220.00,'AVAILABLE',10),
(322,222,'Chicken Roll','Fast Food','Chicken roll with vegetables',140.00,'AVAILABLE',5),
(323,223,'Mutton Kebab','Starters','Tender mutton kebab',280.00,'UNAVAILABLE',0),
(324,224,'Chicken Rice','Rice','Chicken fried rice',190.00,'AVAILABLE',15),
(325,225,'French Fries','Fast Food','Crispy golden fries',100.00,'AVAILABLE',50);


-- =========================================================
-- DISPLAY ALL MENU ITEMS
-- =========================================================

SELECT * FROM MenuItem;


-- =========================================================
-- UPDATE MENU ITEM 307
-- =========================================================

UPDATE MenuItem
SET Stock = 20,
    AvailabilityStatus = 'AVAILABLE'
WHERE MenuItemID = 307;

SELECT * FROM MenuItem
WHERE MenuItemID = 307;


-- =========================================================
-- UPDATE MENU ITEM 302
-- =========================================================

UPDATE MenuItem
SET Stock = 0,
    AvailabilityStatus = 'UNAVAILABLE'
WHERE MenuItemID = 302;

SELECT * FROM MenuItem
WHERE MenuItemID = 302;


-- =========================================================
-- UPDATE MENU ITEM 311
-- =========================================================

UPDATE MenuItem
SET Stock = 15,
    AvailabilityStatus = 'AVAILABLE'
WHERE MenuItemID = 311;

SELECT * FROM MenuItem
WHERE MenuItemID = 311;


-- =========================================================
-- UPDATE RESTAURANT 201
-- =========================================================

UPDATE Restaurant
SET ContactNo = '9876599999',
    Address = 'Madurai'
WHERE RestaurantID = 201;

SELECT * FROM Restaurant
WHERE RestaurantID = 201;


-- =========================================================
-- DELETE MENU ITEM 325
-- =========================================================

DELETE FROM MenuItem
WHERE MenuItemID = 325;

SELECT * FROM MenuItem;


-- =========================================================
-- DISPLAY AVAILABLE FOOD ITEMS
-- =========================================================

SELECT *
FROM MenuItem
WHERE AvailabilityStatus = 'AVAILABLE';


-- =========================================================
-- DISPLAY UNAVAILABLE FOOD ITEMS
-- =========================================================

SELECT *
FROM MenuItem
WHERE AvailabilityStatus = 'UNAVAILABLE';


-- =========================================================
-- COUNT AVAILABLE FOOD ITEMS
-- =========================================================

SELECT COUNT(*) AS AvailableItems
FROM MenuItem
WHERE AvailabilityStatus = 'AVAILABLE';


-- =========================================================
-- COUNT UNAVAILABLE FOOD ITEMS
-- =========================================================

SELECT COUNT(*) AS UnavailableItems
FROM MenuItem
WHERE AvailabilityStatus = 'UNAVAILABLE';


-- =========================================================
-- DISPLAY MENU ITEMS BY STOCK
-- =========================================================

SELECT *
FROM MenuItem
ORDER BY Stock DESC;


-- =========================================================
-- FINAL DISPLAY
-- =========================================================

SELECT * FROM MenuItem;

SELECT * FROM Restaurant;

