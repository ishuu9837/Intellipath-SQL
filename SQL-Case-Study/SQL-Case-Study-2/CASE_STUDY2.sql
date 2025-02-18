create database casestudy
use casestudy


--  Create Tables
-- Creating Location Table
CREATE TABLE Location (
    Location_ID INT PRIMARY KEY,
    City VARCHAR(50)
);

-- Creating Department Table
CREATE TABLE Department (
    Department_Id INT PRIMARY KEY,
    Name VARCHAR(50),
    Location_Id INT,
    FOREIGN KEY (Location_Id) REFERENCES Location(Location_ID)
);

-- Creating Job Table
CREATE TABLE Job (
    Job_ID INT PRIMARY KEY,
    Designation VARCHAR(50)
);

-- Creating Employee Table
CREATE TABLE Employee (
    Employee_Id INT PRIMARY KEY,
    Last_Name VARCHAR(50),
    First_Name VARCHAR(50),
    Middle_Name VARCHAR(50),
    Job_Id INT,
    Hire_Date DATE,
    Salary DECIMAL(10,2),
    Commission DECIMAL(10,2),
    Department_Id INT,
    FOREIGN KEY (Job_Id) REFERENCES Job(Job_ID),
    FOREIGN KEY (Department_Id) REFERENCES Department(Department_Id)
);

--  Insert Data
-- Inserting into Location Table
INSERT INTO Location (Location_ID, City) VALUES
(122, 'New York'), (123, 'Dallas'), (124, 'Chicago'), (167, 'Boston');

-- Inserting into Department Table
INSERT INTO Department (Department_Id, Name, Location_Id) VALUES
(10, 'Accounting', 122), (20, 'Sales', 124), (30, 'Research', 123), (40, 'Operations', 167);

-- Inserting into Job Table
INSERT INTO Job (Job_ID, Designation) VALUES
(667, 'Clerk'), (668, 'Staff'), (669, 'Analyst'), (670, 'Sales Person'), (671, 'Manager'), (672, 'President');

-- Inserting into Employee Table
INSERT INTO Employee (Employee_Id, Last_Name, First_Name, Middle_Name, Job_Id, Hire_Date, Salary, Commission, Department_Id) VALUES
(7369, 'Smith', 'John', 'Q', 667, '1984-12-17', 800, NULL, 20),
(7499, 'Allen', 'Kevin', 'J', 670, '1985-02-20', 1600, 300, 30),
(755, 'Doyle', 'Jean', 'K', 671, '1985-04-04', 2850, NULL, 30),
(756, 'Dennis', 'Lynn', 'S', 671, '1985-05-15', 2750, NULL, 30),
(757, 'Baker', 'Leslie', 'D', 671, '1985-06-10', 2200, NULL, 40),
(7521, 'Wark', 'Cynthia', 'D', 670, '1985-02-22', 1250, 50, 30);

-- Simple Queries (7 Queries)

-- 1. List all employee details.
SELECT * FROM Employee;

-- 2. List all department details.
SELECT * FROM Department;

-- 3. List all job details.
SELECT * FROM Job;

-- 4. List all locations.
SELECT * FROM Location;

-- 5. List out the First Name, Last Name, Salary, and Commission for all Employees.
SELECT First_Name, Last_Name, Salary, Commission FROM Employee;

-- 6. List out the Employee ID, Last Name, and Department ID for all employees, aliasing columns.
SELECT Employee_Id AS Employee_ID, 
       Last_Name AS Employee_Name, 
       Department_Id AS Department_ID 
FROM Employee;

-- 7. List out the annual salary of the employees with their names.
SELECT First_Name, 
       Last_Name, 
       Salary * 12 AS Annual_Salary 
FROM Employee;





-- WHERE Condition (10 Queries)

-- 1. List the details about "Smith".
SELECT * FROM Employee WHERE Last_Name = 'Smith';

-- 2. List out the employees who are working in department 20.
SELECT * FROM Employee WHERE Department_Id = 20;

-- 3. List out the employees who are earning salary between 2000 and 3000.
SELECT * FROM Employee WHERE Salary BETWEEN 2000 AND 3000;

-- 4. List out the employees who are working in department 10 or 20.
SELECT * FROM Employee WHERE Department_Id IN (10, 20);

-- 5. Find out the employees who are not working in department 10 or 30.
SELECT * FROM Employee WHERE Department_Id NOT IN (10, 30);

-- 6. List out the employees whose name starts with 'L'.
SELECT * FROM Employee WHERE First_Name LIKE 'L%';

-- 7. List out the employees whose name starts with 'L' and ends with 'E'.
SELECT * FROM Employee WHERE First_Name LIKE 'L%E';

-- 8. List out the employees whose name length is 4 and start with 'J'.
SELECT * FROM Employee WHERE LEN(First_Name) = 4 AND First_Name LIKE 'J%';

-- 9. List out the employees who are working in department 30 and draw the salaries more than 2500.
SELECT * FROM Employee WHERE Department_Id = 30 AND Salary > 2500;

-- 10. List out the employees who are not receiving commission.
SELECT * FROM Employee WHERE Commission IS NULL;




-- ORDER BY Clause (4 Queries)

-- 1. List out the Employee ID and Last Name in ascending order based on the Employee ID.
SELECT Employee_Id AS Employee_ID, 
       Last_Name AS Employee_Name 
FROM Employee 
ORDER BY Employee_Id ASC;

-- 2. List out the Employee ID and Name in descending order based on salary.
SELECT Employee_Id AS Employee_ID, 
       First_Name AS First_Name, 
       Last_Name AS Last_Name, 
       Salary AS Salary 
FROM Employee 
ORDER BY Salary DESC;

-- 3. List out the employee details according to their Last Name in ascending order.
SELECT Employee_Id AS Employee_ID, 
       First_Name AS First_Name, 
       Last_Name AS Last_Name, 
       Job_Id AS Job_ID, 
       Hire_Date AS Hire_Date, 
       Salary AS Salary, 
       Commission AS Commission, 
       Department_Id AS Department_ID 
FROM Employee 
ORDER BY Last_Name ASC;

-- 4. List out the employee details according to their Last Name in ascending order and then Department ID in descending order.
SELECT Employee_Id AS Employee_ID, 
       First_Name AS First_Name, 
       Last_Name AS Last_Name, 
       Job_Id AS Job_ID, 
       Hire_Date AS Hire_Date, 
       Salary AS Salary, 
       Commission AS Commission, 
       Department_Id AS Department_ID 
FROM Employee 
ORDER BY Last_Name ASC, Department_Id DESC;






-- GROUP BY and HAVING Clause (11 Queries)

-- 1. List out the department-wise maximum salary, minimum salary, and average salary of the employees.
SELECT Department_Id, 
       MAX(Salary) AS Max_Salary, 
       MIN(Salary) AS Min_Salary, 
       AVG(Salary) AS Avg_Salary 
FROM Employee 
GROUP BY Department_Id;

-- 2. List out the job-wise maximum salary, minimum salary, and average salary of the employees.
SELECT Job_Id, 
       MAX(Salary) AS Max_Salary, 
       MIN(Salary) AS Min_Salary, 
       AVG(Salary) AS Avg_Salary 
FROM Employee 
GROUP BY Job_Id;

-- 3. List out the number of employees who joined each month in ascending order.
SELECT MONTH(Hire_Date) AS Hiring_Month, 
       COUNT(*) AS Employee_Count 
FROM Employee 
GROUP BY MONTH(Hire_Date) 
ORDER BY Hiring_Month;

-- 4. List out the number of employees for each month and year in ascending order based on the year and month.
SELECT YEAR(Hire_Date) AS Hiring_Year, 
       MONTH(Hire_Date) AS Hiring_Month, 
       COUNT(*) AS Employee_Count 
FROM Employee 
GROUP BY YEAR(Hire_Date), MONTH(Hire_Date) 
ORDER BY Hiring_Year, Hiring_Month;

-- 5. List out the Department ID having at least four employees.
SELECT Department_Id, 
       COUNT(*) AS Employee_Count 
FROM Employee 
GROUP BY Department_Id 
HAVING COUNT(*) >= 4;

-- 6. How many employees joined in February month?
SELECT COUNT(*) AS Employees_Joined_In_February 
FROM Employee 
WHERE MONTH(Hire_Date) = 2;

-- 7. How many employees joined in May or June month?
SELECT COUNT(*) AS Employees_Joined_In_May_Or_June 
FROM Employee 
WHERE MONTH(Hire_Date) IN (5,6);

-- 8. How many employees joined in 1985?
SELECT COUNT(*) AS Employees_Joined_In_1985 
FROM Employee 
WHERE YEAR(Hire_Date) = 1985;

-- 9. How many employees joined each month in 1985?
SELECT MONTH(Hire_Date) AS Hiring_Month, 
       COUNT(*) AS Employee_Count 
FROM Employee 
WHERE YEAR(Hire_Date) = 1985 
GROUP BY MONTH(Hire_Date) 
ORDER BY Hiring_Month;

-- 10. How many employees were joined in April 1985?
SELECT COUNT(*) AS Employees_Joined_In_April_1985 
FROM Employee 
WHERE YEAR(Hire_Date) = 1985 AND MONTH(Hire_Date) = 4;

-- 11. Which is the Department ID having greater than or equal to 3 employees joining in April 1985?
SELECT Department_Id, 
       COUNT(*) AS Employee_Count 
FROM Employee 
WHERE YEAR(Hire_Date) = 1985 AND MONTH(Hire_Date) = 4 
GROUP BY Department_Id 
HAVING COUNT(*) >= 3;





-- Joins (8 Queries)

-- 1. List out employees with their department names.
SELECT e.Employee_Id AS Employee_ID, 
       e.First_Name AS First_Name, 
       e.Last_Name AS Last_Name, 
       d.Name AS Department_Name 
FROM Employee e 
JOIN Department d ON e.Department_Id = d.Department_Id;

-- 2. Display employees with their designations.
SELECT e.Employee_Id AS Employee_ID, 
       e.First_Name AS First_Name, 
       e.Last_Name AS Last_Name, 
       j.Designation AS Job_Title 
FROM Employee e 
JOIN Job j ON e.Job_Id = j.Job_ID;

-- 3. Display the employees with their department names and city.
SELECT e.Employee_Id AS Employee_ID, 
       e.First_Name AS First_Name, 
       e.Last_Name AS Last_Name, 
       d.Name AS Department_Name, 
       l.City AS Location_City 
FROM Employee e 
JOIN Department d ON e.Department_Id = d.Department_Id 
JOIN Location l ON d.Location_Id = l.Location_ID;

-- 4. How many employees are working in different departments? Display with department names.
SELECT d.Name AS Department_Name, 
       COUNT(e.Employee_Id) AS Employee_Count 
FROM Employee e 
JOIN Department d ON e.Department_Id = d.Department_Id 
GROUP BY d.Name;

-- 5. How many employees are working in the sales department?
SELECT COUNT(*) AS Sales_Department_Employees 
FROM Employee e 
JOIN Department d ON e.Department_Id = d.Department_Id 
WHERE d.Name = 'Sales';

-- 6. Which is the department having greater than or equal to 3 employees? Display department names in ascending order.
SELECT d.Name AS Department_Name, 
       COUNT(e.Employee_Id) AS Employee_Count 
FROM Employee e 
JOIN Department d ON e.Department_Id = d.Department_Id 
GROUP BY d.Name 
HAVING COUNT(e.Employee_Id) >= 3 
ORDER BY d.Name ASC;

-- 7. How many employees are working in 'Dallas'?
SELECT COUNT(e.Employee_Id) AS Employees_In_Dallas 
FROM Employee e 
JOIN Department d ON e.Department_Id = d.Department_Id 
JOIN Location l ON d.Location_Id = l.Location_ID 
WHERE l.City = 'Dallas';

-- 8. Display all employees in sales or operations departments.
SELECT e.Employee_Id AS Employee_ID, 
       e.First_Name AS First_Name, 
       e.Last_Name AS Last_Name, 
       d.Name AS Department_Name 
FROM Employee e 
JOIN Department d ON e.Department_Id = d.Department_Id 
WHERE d.Name IN ('Sales', 'Operations');

-- CONDITIONAL STATEMENT (3 Queries)

-- 1. Display the employee details with salary grades. Use conditional statement to create a grade column.
SELECT e.Employee_Id AS Employee_ID, 
       e.First_Name AS First_Name, 
       e.Last_Name AS Last_Name, 
       e.Salary AS Salary, 
       CASE 
           WHEN e.Salary >= 5000 THEN 'A' 
           WHEN e.Salary BETWEEN 3000 AND 4999 THEN 'B' 
           WHEN e.Salary BETWEEN 1000 AND 2999 THEN 'C' 
           ELSE 'D' 
       END AS Salary_Grade 
FROM Employee e;

-- 2. List out the number of employees grade-wise. Use conditional statement to create a grade column.
SELECT Salary_Grade, COUNT(*) AS Employee_Count 
FROM (
    SELECT CASE 
               WHEN Salary >= 5000 THEN 'A' 
               WHEN Salary BETWEEN 3000 AND 4999 THEN 'B' 
               WHEN Salary BETWEEN 1000 AND 2999 THEN 'C' 
               ELSE 'D' 
           END AS Salary_Grade 
    FROM Employee
) AS SalaryGrades 
GROUP BY Salary_Grade;

-- 3. Display the employee salary grades and the number of employees between 2000 to 5000 range of salary.
SELECT Salary_Grade, COUNT(*) AS Employee_Count 
FROM (
    SELECT CASE 
               WHEN Salary >= 5000 THEN 'A' 
               WHEN Salary BETWEEN 3000 AND 4999 THEN 'B' 
               WHEN Salary BETWEEN 2000 AND 2999 THEN 'C' 
               ELSE 'D' 
           END AS Salary_Grade 
    FROM Employee 
    WHERE Salary BETWEEN 2000 AND 5000
) AS SalaryGrades 
GROUP BY Salary_Grade;



-- Subqueries (10 Queries)

-- 1. Display the employees list who got the maximum salary.
SELECT * FROM Employee 
WHERE Salary = (SELECT MAX(Salary) FROM Employee);

-- 2. Display the employees who are working in the sales department.
SELECT * FROM Employee 
WHERE Department_Id = (SELECT Department_Id FROM Department WHERE Name = 'Sales');

-- 3. Display the employees who are working as 'Clerk'.
SELECT * FROM Employee 
WHERE Job_Id = (SELECT Job_ID FROM Job WHERE Designation = 'Clerk');

-- 4. Display the list of employees who are living in 'Boston'.
SELECT * FROM Employee 
WHERE Department_Id IN (SELECT Department_Id FROM Department WHERE Location_Id = (SELECT Location_ID FROM Location WHERE City = 'Boston'));

-- 5. Find out the number of employees working in the sales department.
SELECT COUNT(*) AS Sales_Employees_Count FROM Employee 
WHERE Department_Id = (SELECT Department_Id FROM Department WHERE Name = 'Sales');

-- 6. Update the salaries of employees who are working as clerks on the basis of 10%.
UPDATE Employee 
SET Salary = Salary * 1.10 
WHERE Job_Id = (SELECT Job_ID FROM Job WHERE Designation = 'Clerk');

-- 7. Display the second highest salary drawing employee details.
SELECT * FROM Employee 
WHERE Salary = (
    SELECT MAX(Salary) FROM Employee 
    WHERE Salary < (SELECT MAX(Salary) FROM Employee)
);

-- 8. List out the employees who earn more than every employee in department 30.
SELECT * FROM Employee 
WHERE Salary > ALL (SELECT Salary FROM Employee WHERE Department_Id = 30);

-- 9. Find out which department has no employees.
SELECT * FROM Department 
WHERE Department_Id NOT IN (SELECT DISTINCT Department_Id FROM Employee);

-- 10. Find out the employees who earn greater than the average salary for their department.
SELECT * FROM Employee e 
WHERE Salary > (SELECT AVG(Salary) FROM Employee WHERE Department_Id = e.Department_Id);
