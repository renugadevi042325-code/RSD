CREATE DATABASE IF NOT EXISTS FOOD_ORDERING;

USE FOOD_ORDERING;


CREATE TABLE Review
(
    ReviewID INT PRIMARY KEY,
    CustomerName VARCHAR(100),
    ProductID INT,
    ReviewText VARCHAR(255),
    ReviewDate DATE
);


CREATE TABLE Rating
(
    RatingID INT PRIMARY KEY,
    ReviewID INT,
    Rating INT,
    FOREIGN KEY (ReviewID) REFERENCES Review(ReviewID)
);


INSERT INTO Review VALUES
(1, 'Arun', 101, 'Food was very good', '2026-09-01'),
(2, 'Priya', 102, 'Good quality', '2026-09-02'),
(3, 'Kavin', 103, 'Bad quality', '2026-09-03'),
(4, 'Divya', 104, 'Very tasty', '2026-09-04'),
(5, 'Rahul', 105, 'Average taste', '2026-09-05'),
(6, 'Anu', 106, 'Excellent food', '2026-09-06'),
(7, 'Vijay', 107, 'Not fresh', '2026-09-07'),
(8, 'Meena', 108, 'Good taste', '2026-09-08'),
(9, 'Suresh', 109, 'Very good', '2026-09-09'),
(10, 'Nisha', 110, 'Poor quality', '2026-09-10');


INSERT INTO Rating VALUES
(1, 1, 5),
(2, 2, 4),
(3, 3, 2),
(4, 4, 5),
(5, 5, 3),
(6, 6, 5),
(7, 7, 2),
(8, 8, 4),
(9, 9, 5),
(10, 10, 2);


SELECT * FROM Review;


SELECT * FROM Rating;


SELECT Review.ReviewID, CustomerName, ReviewText, Rating
FROM Review
JOIN Rating ON Review.ReviewID = Rating.ReviewID;


SELECT * FROM Rating
WHERE Rating = 5;


SELECT * FROM Rating
WHERE Rating < 3;


SELECT * FROM Review
WHERE ReviewText LIKE '%Good%';


UPDATE Review
SET ReviewText = 'Very good quality'
WHERE ReviewID = 2;


UPDATE Rating
SET Rating = 5
WHERE RatingID = 2;


SELECT COUNT(*) AS TotalReviews
FROM Review;


SELECT AVG(Rating) AS AverageRating
FROM Rating;


SELECT MAX(Rating) AS HighestRating
FROM Rating;