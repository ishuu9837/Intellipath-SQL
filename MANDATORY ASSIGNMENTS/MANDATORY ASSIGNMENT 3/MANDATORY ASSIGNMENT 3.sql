create database assignment3
use assignment3


-- 1. Create a Stored Procedure to Display Restaurants with Table Booking
CREATE PROCEDURE GetRestaurantsWithTableBooking
AS
BEGIN
    SELECT RestaurantName, RestaurantType, CuisinesType
    FROM Jomato
    WHERE TableBooking <> 0;
END;
GO

-- 2. Create a Transaction to Update and Rollback 'Cafe' to 'Cafeteria'
BEGIN TRANSACTION;

UPDATE Jomato
SET CuisinesType = 'Cafeteria'
WHERE CuisinesType = 'Cafe';

-- Check result before rollback
SELECT * FROM Jomato WHERE CuisinesType = 'Cafeteria';

ROLLBACK;

-- Verify rollback
SELECT * FROM Jomato WHERE CuisinesType = 'Cafe';
GO

-- 3. Generate Row Number and Find Top 5 Areas with Highest Ratings
SELECT TOP 5 Area, AVG(Rating) AS AvgRating
FROM Jomato
GROUP BY Area
ORDER BY AvgRating DESC;
GO

-- 4. Use a WHILE Loop to Display Numbers from 1 to 50
DECLARE @counter INT = 1;

WHILE @counter <= 50
BEGIN
    PRINT @counter;
    SET @counter = @counter + 1;
END;
GO

-- 5. Create a View to Store the Top 5 Highest Rated Restaurants
CREATE VIEW TopRatingRestaurants AS
SELECT TOP 5 RestaurantName, Rating
FROM Jomato
ORDER BY Rating DESC;
GO

-- 6. Create a Trigger to Display a Message When a New Record is Inserted
CREATE TRIGGER NotifyOnNewRestaurant
ON Jomato
AFTER INSERT
AS
BEGIN
    PRINT 'A new restaurant record has been added!';
END;
GO

-- Testing the Trigger
INSERT INTO Jomato (orderId, RestaurantName, RestaurantType, Rating, No_of_Rating, AverageCost, OnlineOrder, TableBooking, CuisinesType, Area, LocalAddress, Delivery_time)
VALUES ('9800','New Cafe', 'Italian',4.5, 300, 500, 1, 1, 'Italian', 'Downtown', 'Street 21, City', 30);
GO
select * from Jomato
-- Executing the Stored Procedure
EXEC GetRestaurantsWithTableBooking;
GO

-- Fetch Data from View
SELECT * FROM TopRatingRestaurants;
GO
