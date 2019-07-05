/*
**Exercises solution - filtering and ordering**
*/


-- 1. Display the FullName and PreferredName of all people with preferredName 'Amy'

SELECT 
       FullName , 
       PreferredName
FROM 
     Application.People
WHERE PreferredName = 'Amy';

-- 2. Display StockItemID, StockItemName and Size of all stockItems with size M

SELECT 
       StockItemID , 
       StockItemName , 
       Size
FROM 
     Warehouse.StockItems
WHERE size = 'M';

-- 3. Display the CustomerID, CustomerName and CreditLimit for customer having a creditlimit higher than 3000

SELECT 
       CustomerID , 
       CustomerName , 
       CreditLimit
FROM 
     sales.Customers
WHERE CreditLimit > 3000;

-- 4. Display CustomerID, CustomerName, AccountOpenedDate from customer accounts opned after January 1st, 2016.

SELECT 
       CustomerID , 
       CustomerName , 
       AccountOpenedDate
FROM 
     sales.Customers
WHERE AccountOpenedDate > CONVERT(DATETIME , '01-01-2016');

-- 5. Display the StockItemID, StockItemName, ColorID of all stockItems with color 3,12 or 35

SELECT 
       StockItemID , 
       StockItemName , 
       ColorID
FROM 
     Warehouse.StockItems
WHERE colorID IN ( 3 , 12 , 35
                 );

-- 6. Display the StockItemID, StockItemName, ColorID of all stockItems with color different than 3,12 or 35

SELECT 
       StockItemID , 
       StockItemName , 
       ColorID
FROM 
     Warehouse.StockItems
WHERE colorID NOT IN ( 3 , 12 , 35
                     );

-- 7. Display the CountryID, CountryName, Region and Subregion of countries in subregion Northern or Eastern Europe

SELECT 
       CountryID , 
       CountryName , 
       Region , 
       Subregion
FROM 
     Application.Countries
WHERE Subregion IN ( 'Northern Europe' , 'Eastern Europe'
                   );

-- 8. Display the CustomerID, CustomerName, CreditLimit of all customers whose name ends with an e.

SELECT 
       CustomerID , 
       CustomerName , 
       CreditLimit
FROM 
     sales.Customers
WHERE CustomerName LIKE '%e';

-- 9. Display the CityID and CityName where the third letter in their name is Y.

SELECT 
       CityID , 
       CityName
FROM 
     Application.Cities
WHERE CityName LIKE '__y%';

-- 10. Display CountryID, CountryName for all countries who have the letters : L, J, or H in their name. Sort the query in descending order by country name.

SELECT 
       CountryID , 
       CountryName
FROM 
     Application.Countries
WHERE CountryName LIKE '%L%'
      OR 
      CountryName LIKE '%J%'
      OR 
      CountryName LIKE '%H%'
ORDER BY 
         CountryName DESC;

-- 11. Display the CustomerID, CustomerName for all customers whose name doesn’t have the letter a. Sort the query in ascending order by name.

SELECT 
       CustomerID , 
       CustomerName
FROM 
     sales.Customers
WHERE CustomerName NOT LIKE '%a%'
ORDER BY 
         CustomerName ASC;

-- 12. Display all data from stock items with marketing comments

SELECT 
       StockItemID , 
       StockItemName , 
       MarketingComments
FROM 
     Warehouse.StockItems
WHERE MarketingComments IS NOT NULL;

-- 13. Display the stock item name concatenated with the brand name, separated by hyphen and unitprice , for all stockitems with a brand whose unitprice  is in the range between 1 and 50. Sort the query in ascending order by the brand name.

SELECT 
       concat(StockItemName , ' - ' , brand) AS "full name" , 
       UnitPrice
FROM 
     Warehouse.StockItems
WHERE brand IS NOT NULL
      AND 
      UnitPrice BETWEEN 1 AND 50
ORDER BY 
         brand ASC;

-- 14. Display 
-- Supplier name and supplier reference in the following format 'A Datum Corporation (AA20384)' named "Supllier"
--  Bank account name, bank account branch and International code as follows "A Datum Corporation-Woodgrove Bank Zionsville (25986)" named "Bank"

SELECT 
       concat(SupplierName , ' (' , SupplierReference , ')') AS                                    "Supplier" , 
       concat(BankAccountName , ' - ' , BankAccountBranch , ' (' , BankInternationalCode , ')') AS "Bank"
FROM 
     Purchasing.Suppliers;

-- 15. Display all suppliers where 
--     no delivery method is provided and their bank account branch is 'Woodgrove Bank San Francisco'
--     the bank account branch is 'Woodgrove Bank Karlstad' independent of the delivery method 

SELECT 
       *
FROM 
     Purchasing.Suppliers
WHERE ( DeliveryMethodID IS NULL
        AND 
        BankAccountBranch LIKE 'Woodgrove Bank San Francisco' )
      OR 
      ( BankAccountBranch LIKE 'Woodgrove Bank Karlstad' );

-- 16. Display CustomerID, CustomerName and AccountOpenedDate of customer accounts opened during October 10th, 2013 and January 1, 2014.

SELECT 
       CustomerID , 
       CustomerName , 
       AccountOpenedDate
FROM 
     sales.Customers
WHERE AccountOpenedDate BETWEEN CONVERT(DATE , '2013-10-10') AND CONVERT(DATE , '2014-01-01');

-- 17. Display the StockItemName, StockItemID, TaxRate , UnitPrice and calculcate the "Extended prcice" (Unitprice augmented with it's tax). Sort the query in a descending order by the extended pri e.

SELECT 
       StockItemName , 
       StockItemID , 
       TaxRate , 
       UnitPrice , 
       unitprice * ( 1 + taxrate / 100 ) AS "Extended price"
FROM 
     Warehouse.StockItems
WHERE StockItemName LIKE '%chocolate%'
ORDER BY 
         unitprice * ( 1 + taxrate / 100 ) DESC;

-- 18. Display the InvoiceLineID, Description and ExtendedPrice of all invoice lines with an extended price higher of equal than 5152 ordered by extended price ascencding

SELECT 
       InvoiceLineID , 
       Description , 
       ExtendedPrice
FROM 
     Sales.InvoiceLines
WHERE ExtendedPrice >= 5152
ORDER BY 
         ExtendedPrice ASC;

-- 19. Display the StockItemID, StockItemName and ColorID for all  stockitems whose colorId is equal to 12, 3 or 35
--     - Perform this exercise once by using the IN operator
--     - Perform this exercise once by using the OR operator

SELECT 
       StockItemID , 
       StockItemName , 
       ColorID
FROM 
     Warehouse.StockItems
WHERE ColorID IN ( 12 , 3 , 35
                 );

SELECT 
       StockItemID , 
       StockItemName , 
       ColorID
FROM 
     Warehouse.StockItems
WHERE ColorID = 12
      OR 
      ColorID = 3
      OR 
      ColorID = 35;

-- 20. Display the PurchaseOrderID, SupplierID for all purchase orders without comments

SELECT 
       PurchaseOrderID , 
       SupplierID
FROM 
     Purchasing.PurchaseOrders
WHERE comments IS NULL;

-- 21. Display the CustomerID and CustomerName with a creditlimit.

SELECT 
       CustomerID , 
       CustomerName
FROM 
     sales.Customers
WHERE creditlimit IS NOT NULL;