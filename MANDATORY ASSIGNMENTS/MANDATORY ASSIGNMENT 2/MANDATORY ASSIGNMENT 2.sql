create database assignment2
use assignment2

----QUERIES----------



---------- TASK 1: Create a User-Defined Function to Add "Chicken" into "Quick Bites"

CREATE FUNCTION dbo.StuffChicken (@RestaurantType NVARCHAR(100))
RETURNS NVARCHAR(100)
AS
BEGIN
    IF @RestaurantType = 'Quick Bites'
        RETURN 'Quick Chicken Bites'
    RETURN @RestaurantType
END;

-- TEST the function
SELECT dbo.AddChickenBites('Quick Bites') AS Modified_RestaurantType;

------------------------------------------------------------
-- TASK 2: Display Restaurant Name & Cuisine Type with Max Rating

SELECT TOP 1 RestaurantName, CuisinesType, No_of_Rating
FROM Jomato
ORDER BY No_of_Rating DESC;

-- TASK 3: Create a Rating Status Column for Categorization

SELECT 
    RestaurantName,
    Rating,
    CASE 
        WHEN Rating > 4 THEN 'Excellent'
        WHEN Rating > 3.5 AND Rating <= 4 THEN 'Good'
        WHEN Rating > 3 AND Rating <= 3.5 THEN 'Average'
        ELSE 'Bad'
    END AS RatingStatus
FROM Jomato;

-- TASK 4: Calculate Ceil, Floor, Absolute Values of Rating and Display Date Info
SELECT 
    RestaurantName,
    Rating,
    CEILING(Rating) AS CeilValue,
    FLOOR(Rating) AS FloorValue,
    ABS(Rating) AS AbsoluteValue,
    GETDATE() AS CurrentDate,
    YEAR(GETDATE()) AS Year,
    MONTH(GETDATE()) AS Month,
    DATENAME(MONTH, GETDATE()) AS MonthName,
    DAY(GETDATE()) AS Day
FROM Jomato;

-- TASK 5: Display Restaurant Type and Total Average Cost Using ROLLUP

SELECT 
    RestaurantType, 
    SUM(AverageCost) AS Total_Avg_Cost
FROM Jomato
GROUP BY ROLLUP(RestaurantType);
