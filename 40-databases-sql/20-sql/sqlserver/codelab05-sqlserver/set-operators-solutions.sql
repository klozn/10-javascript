/*
**Exercises solution - Set Operators**
*/

-- 1. Provide a single list of all countries and States (column name = "Name") and their type (either Country or State)

SELECT 
       CountryName AS "Name" , 
       'Country' AS   "Type"
FROM 
     Application.Countries
UNION
SELECT 
       StateProvinceName AS "Name" , 
       'State' AS           "Type"
FROM 
     Application.StateProvinces;

-- 2. Provide a singe list of FullName and type ('Primary' or 'Alternate') of all contact persons of customer accounts

SELECT 
       FullName , 
       'Primary' AS "Type"
FROM 
     Application.People
WHERE PersonID IN (
                      SELECT 
                             PrimaryContactPersonID
                      FROM 
                           sales.Customers
                  ) 
UNION ALL
SELECT 
       FullName , 
       'Alternate' AS "Type"
FROM 
     Application.People
WHERE PersonID IN (
                      SELECT 
                             AlternateContactPersonID
                      FROM 
                           sales.Customers
                  );

-- 3. Provide a singe list of StockItemID and StockItemName of those items having colorID 3 and delivered by supplier 4 (using SET operators)

SELECT 
       StockItemID , 
       StockItemName
FROM 
     Warehouse.StockItems
WHERE ColorID = 35
EXCEPT
SELECT 
       StockItemID , 
       StockItemName
FROM 
     Warehouse.StockItems
WHERE SupplierID = 4;

-- 4. Provide a singe list of CustomerID and CustomerName that are in the customers table and in the customers archive 

SELECT 
       CustomerID , 
       CustomerName
FROM 
     Sales.Customers
INTERSECT
SELECT 
       CustomerID , 
       CustomerName
FROM 
     Sales.Customers_Archive;