create database assignment1
use assignment1

----Salesman table creation
CREATE TABLE Salesman (
SalesmanId INT,
Name VARCHAR(255),
Commission DECIMAL(10, 2),
City VARCHAR(255),
Age INT
);


---Salesman table record insertion
INSERT INTO Salesman (SalesmanId, Name, Commission, City, Age)
VALUES
(101, 'Joe', 50, 'California', 17),
(102, 'Simon', 75, 'Texas', 25),
(103, 'Jessie', 105, 'Florida', 35),
(104, 'Danny', 100, 'Texas', 22),
(105, 'Lia', 65, 'New Jersey', 30);

----Customer Table

--Customer table creation
CREATE TABLE Customer (
SalesmanId INT,
CustomerId INT,
CustomerName VARCHAR(255),
PurchaseAmount INT,
);
---------Customer table record insertion
INSERT INTO Customer (SalesmanId, CustomerId, CustomerName, PurchaseAmount)
VALUES
(101, 2345, 'Andrew', 550),
(103, 1575, 'Lucky', 4500),
(104, 2345, 'Andrew', 4000),
(107, 3747, 'Remona', 2700),
(110, 4004, 'Julia', 4545);

---------Orders Table

--------Orders table Creation

CREATE TABLE Orders (OrderId int, CustomerId int, SalesmanId int, Orderdate Date, Amount
money)

----Orders table record insertion
INSERT INTO Orders Values
(5001,2345,101,'2021-07-01',550),
(5003,1234,105,'2022-02-15',1500)


-----------QUERIES------------------

-- 1. Insert a new record in your Orders table
INSERT INTO Orders (OrderId, CustomerId, SalesmanId, OrderDate, Amount)
VALUES (5004, 1575, 103, '2025-02-17', 1200);

-- 2. Constraints are already added in the table creation step
ALTER TABLE Customer
ALTER COLUMN CustomerName VARCHAR(255) NOT NULL;

-- 3. Fetch customers whose names end with 'N' and have a PurchaseAmount > 500
SELECT * FROM Customer
WHERE CustomerName LIKE '%N' AND PurchaseAmount > 500;

-- 4. Using SET operators to retrieve SalesmanId values
-- Unique SalesmanId values from Salesman and Orders tables
SELECT SalesmanId FROM Salesman
UNION
SELECT SalesmanId FROM Orders;

-- SalesmanId values with duplicates from Salesman and Orders tables
SELECT SalesmanId FROM Salesman
UNION ALL
SELECT SalesmanId FROM Orders;

-- 5. Display OrderDate, Salesman Name, Customer Name, Commission, and City for PurchaseAmount between 500 and 1500
SELECT Orders.OrderDate, Salesman.Name AS SalesmanName, Customer.CustomerName, 
       Salesman.Commission, Salesman.City
FROM Orders
JOIN Salesman ON Orders.SalesmanId = Salesman.SalesmanId
JOIN Customer ON Orders.CustomerId = Customer.CustomerId
WHERE Orders.Amount BETWEEN 500 AND 1500;

-- 6. Using RIGHT JOIN to fetch all results from Salesman and Orders table
SELECT Salesman.SalesmanId, Salesman.Name AS SalesmanName, Orders.*
FROM Salesman
RIGHT JOIN Orders ON Salesman.SalesmanId = Orders.SalesmanId;