/*
**Exercises solution - simple select**
*/

--1. For each order, display all information

SELECT 
       *
FROM 
     Sales.Orders;

--2. For each order, display OrderID, CustomerID, SalesPersonID and Order Date

SELECT 
       OrderID , 
       CustomerID , 
       SalespersonPersonID , 
       OrderDate
FROM 
     Sales.Orders;

--3. For each order, display Order Date, CustomerID, OrderID, SalesPersonID in this exact order

SELECT 
       OrderDate , 
       CustomerID , 
       OrderID , 
       SalespersonPersonID
FROM 
     Sales.Orders;

--4. For each customer display all information

SELECT 
       *
FROM 
     Sales.Customers;

--5. For each customer display customer number and Customer name

SELECT 
       CustomerID , 
       CustomerName
FROM 
     Sales.Customers;

--6. Display customer number and customer name for customer 'Tailspin Toys (Topstone, CT)'

SELECT 
       CustomerID , 
       CustomerName
FROM 
     Sales.Customers
WHERE CustomerName = 'Tailspin Toys (Topstone, CT)';

--7. Display the OrderID, CustomerID, SalespersonPersonID, OrderDate of all orders made for Tailspin Toys (Topstone, CT)

SELECT 
       OrderID , 
       CustomerID , 
       SalespersonPersonID , 
       OrderDate
FROM 
     Sales.Orders
WHERE CustomerID = 165;

--8. Display the OrderID, CustomerID, SalespersonPersonID, OrderDate of all orders made for Tailspin Toys (Topstone, CT) ordered by date

SELECT 
       OrderID , 
       CustomerID , 
       SalespersonPersonID , 
       OrderDate
FROM 
     Sales.Orders
WHERE CustomerID = 165
ORDER BY 
         OrderDate DESC;

--9. Display the OrderID, CustomerID, SalespersonPersonID, OrderDate of all orders made for Tailspin Toys (Topstone, CT) ordered by date (oldest date first)

SELECT 
       OrderID , 
       CustomerID , 
       SalespersonPersonID , 
       OrderDate
FROM 
     Sales.Orders
WHERE CustomerID = 165
ORDER BY 
         OrderDate ASC;

--10. Display the OrderID, CustomerID, SalespersonPersonID, OrderDate of all orders made for Tailspin Toys (Topstone, CT) ordered by date (oldest date first) and OrderId (descending)

SELECT 
       OrderID , 
       CustomerID , 
       SalespersonPersonID , 
       OrderDate
FROM 
     Sales.Orders
WHERE CustomerID = 165
ORDER BY 
         OrderDate ASC , 
         CustomerID DESC;

--11. Display the PersonID, FullName, EmailAddress of the primary contact person of Tailspin Toys (Topstone, CT)

SELECT 
       PrimaryContactPersonID
FROM 
     sales.Customers
WHERE CustomerName = 'Tailspin Toys (Topstone, CT)';

SELECT 
       PersonID , 
       FullName , 
       EmailAddress
FROM 
     Application.People
WHERE PersonID = 1329;

--12. Display all tables you have access to in the WideWorldImporters database (tip: INFORMATION_SCHEMA)

SELECT 
       *
FROM 
     INFORMATION_SCHEMA.TABLES
WHERE TABLE_TYPE = 'BASE TABLE'
      AND 
      TABLE_CATALOG = 'WideWorldImporters';

-- FYI: INFORMATION_SCHEMA is SQL server specific
--13. Explore the detail of the columns of of table sales.OrderLines (tip: stored procedure 'sp_columns')

EXEC sp_columns OrderLines;

-- OR

SELECT 
       *
FROM 
     INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'OrderLines';

--14. For each city display cityID, CityName, StateProvinceID

SELECT 
       CityID , 
       CityName , 
       StateProvinceID
FROM 
     Application.Cities;

--15. Display cityID, CityName, StateProvinceID for all cities located in Mississippi

SELECT 
       StateProvinceID
FROM 
     Application.StateProvinces
WHERE StateProvinceName = 'Mississippi';

SELECT 
       CityID , 
       CityName , 
       StateProvinceID
FROM 
     Application.Cities
WHERE StateProvinceID = 25;

--16. Display CityID, CityName, StateProvinceID of all cities lying in the United States and within the Sales territory 'Far West'

SELECT 
       CountryID , 
       CountryName
FROM 
     Application.Countries
WHERE CountryName = 'United States';

SELECT 
       StateProvinceID , 
       StateProvinceName , 
       SalesTerritory
FROM 
     Application.StateProvinces
WHERE CountryID = 230
      AND 
      SalesTerritory = 'Far West';

SELECT 
       CityID , 
       CityName , 
       StateProvinceID
FROM 
     Application.Cities
WHERE StateProvinceID IN ( 2 , 5 , 12 , 29 , 38 , 50
                         );