/*
**Exercises solution - subqueries**
*/

-- 1. Display the StockItem ID, Name and unit price of all stock items with a unit price higher than item 73.

SELECT 
       StockItemID , 
       StockItemName , 
       UnitPrice
FROM 
     Warehouse.StockItems
WHERE UnitPrice > (
                      SELECT 
                             UnitPrice
                      FROM 
                           Warehouse.StockItems
                      WHERE StockItemID = 73
                  );

-- 2. Display the city ID, Name and State of cities in the same State as 'Abie'

SELECT 
       CityID , 
       CityName , 
       StateProvinceID
FROM 
     Application.Cities
WHERE StateProvinceID = (
                            SELECT 
                                   StateProvinceID
                            FROM 
                                 Application.Cities
                            WHERE CityName LIKE 'Abie'
                        );

-- 3. Display the CustomerID, CustomerName and AccountOpenedDate from all customers accounts opened after Customer 'Jibek Juniskyzy'

SELECT 
       CustomerID , 
       CustomerName , 
       AccountOpenedDate
FROM 
     sales.Customers
WHERE AccountOpenedDate > (
                              SELECT 
                                     AccountOpenedDate
                              FROM 
                                   sales.Customers
                              WHERE CustomerName = 'Jibek Juniskyzy'
                          );

-- 4. Display the CustomerID, CustomerName and CustomerCategoryID of all customers of the type 'Gift Store'

SELECT 
       CustomerID , 
       CustomerName , 
       CustomerCategoryID
FROM 
     sales.Customers
WHERE CustomerCategoryID = (
                               SELECT 
                                      CustomerCategoryID
                               FROM 
                                    sales.CustomerCategories
                               WHERE CustomerCategoryName = 'Gift Store'
                           );

-- 5. Display the CustomerID, CustomerName and DeliveryCityID of all customers located in city 'Akhiok'

SELECT 
       CustomerID , 
       CustomerName , 
       DeliveryCityID
FROM 
     sales.Customers
WHERE DeliveryCityID = (
                           SELECT 
                                  CityID
                           FROM 
                                Application.Cities
                           WHERE CityName LIKE 'Akhiok'
                       );

-- 6. Display the InvoiceLineID, InvoiceID, StockItemID and Description of all invoice lines on the same invoice as InvoiceLineID 5

SELECT 
       InvoiceLineID , 
       InvoiceID , 
       StockItemID , 
       Description
FROM 
     sales.Invoicelines
WHERE InvoiceID = (
                      SELECT 
                             InvoiceID
                      FROM 
                           sales.InvoiceLines
                      WHERE InvoiceLineID = 5
                  );

-- 7. Display the StockItemID, StockItemName, UnitPrice of all stockItems with a unitprice higher than the average unitprice

SELECT 
       StockItemID , 
       StockItemName , 
       UnitPrice
FROM 
     Warehouse.StockItems
WHERE UnitPrice > (
                      SELECT 
                             AVG(UnitPrice)
                      FROM 
                           Warehouse.StockItems
                  );

-- 8. Display the StockItemID, StockItemName, UnitPrice and brand of all unbranded stockItems with a price equal to one of the stockitems of the brand 'Northwind' 

SELECT 
       StockItemID , 
       StockItemName , 
       UnitPrice , 
       brand
FROM 
     Warehouse.StockItems
WHERE UnitPrice IN (
                       SELECT 
                              UnitPrice
                       FROM 
                            Warehouse.StockItems
                       WHERE brand LIKE 'Northwind'
                   )
      AND 
      brand IS NULL;

-- 9. Display the StockItemID, StockItemName and UnitPrice of all stock items more expensive than all of the items delivered by supplier with ID 12

SELECT 
       StockItemID , 
       StockItemName , 
       UnitPrice
FROM 
     Warehouse.StockItems
WHERE UnitPrice > ALL (
                          SELECT 
                                 UnitPrice
                          FROM 
                               Warehouse.StockItems
                          WHERE SupplierID = 12
                      );

-- 10. Display the StockItemID, StockItemName and UnitPrice of all stock items more expensive than the most expensive item delivered by supplier with ID 12

SELECT 
       StockItemID , 
       StockItemName , 
       UnitPrice
FROM 
     Warehouse.StockItems
WHERE UnitPrice > (
                      SELECT 
                             MAX(UnitPrice)
                      FROM 
                           Warehouse.StockItems
                      WHERE SupplierID = 12
                  );

-- 11. Display the StockItemID, StockItemName and UnitPrice of all stock items less expensive than the least expensive item delivered by supplier with ID 12

SELECT 
       StockItemID , 
       StockItemName , 
       UnitPrice
FROM 
     Warehouse.StockItems
WHERE UnitPrice < (
                      SELECT 
                             MIN(UnitPrice)
                      FROM 
                           Warehouse.StockItems
                      WHERE SupplierID = 12
                  );

-- 12. Display CustomerID, CustomerName and DeliveryCityID of all customers of which the delivery city lies within state Alabama

SELECT 
       CustomerID , 
       CustomerName , 
       DeliveryCityID
FROM 
     sales.Customers
WHERE DeliveryCityID IN (
                            SELECT 
                                   CityID
                            FROM 
                                 Application.Cities
                            WHERE StateProvinceID IN (
                                                         SELECT 
                                                                StateProvinceID
                                                         FROM 
                                                              Application.StateProvinces
                                                         WHERE StateProvinceName LIKE 'Alabama'
                                                     )
                        );

-- 13. Display the StockItemID, StockItemName, ColorID and UnitPrice of sotkc items more expensive than the average item delivered by supllier with ID 5 and that have the same color as the item 'Developer joke mug - Oct 31 = Dec 25 (Black)'

SELECT 
       StockItemID , 
       StockItemName , 
       ColorID , 
       UnitPrice
FROM 
     Warehouse.StockItems
WHERE UnitPrice > (
                      SELECT 
                             AVG(unitprice)
                      FROM 
                           Warehouse.StockItems
                      WHERE supplierID = 5
                  )
      AND 
      ColorID = (
                    SELECT 
                           ColorID
                    FROM 
                         Warehouse.StockItems
                    WHERE StockItemName LIKE 'Developer joke mug - Oct 31 = Dec 25 (Black)'
                );