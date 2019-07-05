/*
**Exercises solution - Group functions**
*/

-- 1. Display the CustomerName of the first Customer if sorted alphabetically by CustomerName.

SELECT 
       MIN(CustomerName)
FROM 
     Sales.Customers;

-- 2. Display the CustomerName of the last Customer if sorted alphabetically by CustomerName.

SELECT 
       MAX(CustomerName)
FROM 
     Sales.Customers;

-- 3. Display the number of rows in Customers table.

SELECT 
       COUNT(CustomerID)
FROM 
     Sales.Customers;

-- 4. Display the number of values (exclude NULLs) in CreditLimit column.

SELECT 
       COUNT(CreditLimit)
FROM 
     Sales.Customers;

-- 5. Display the number of NULL values in commission_pct column.

SELECT 
       COUNT(customerID) - COUNT(CreditLimit)
FROM 
     Sales.Customers;

-- 6. Display the highest, lowest, and average UnitPrice of StockItems

SELECT 
       MIN(UnitPrice) , 
       MAX(UnitPrice) , 
       AVG(UnitPrice)
FROM 
     Warehouse.StockItems;

-- 7. Display the SupplierID and the average unitprice of the items delivered by the supplier

SELECT 
       SupplierID , 
       AVG(UnitPrice)
FROM 
     Warehouse.StockItems
GROUP BY 
         SupplierID;

-- 8. Modify your query to display the results only for departments 50 or 80.

SELECT 
       SupplierID , 
       AVG(UnitPrice)
FROM 
     Warehouse.StockItems
WHERE SupplierID IN ( 10 , 12
                    )
GROUP BY 
         SupplierID;

-- 9. Display the InvoiceID and the number of Invoice lines for each InvoiceID.

SELECT 
       InvoiceID , 
       COUNT(InvoiceLineID)
FROM 
     sales.InvoiceLines
GROUP BY 
         InvoiceID;

-- 10. Modify your query to display the results only for Invoice lines with an ExtendedPrice higher than 1000

SELECT 
       InvoiceID , 
       COUNT(InvoiceLineID)
FROM 
     sales.InvoiceLines
WHERE ExtendedPrice > 1000
GROUP BY 
         InvoiceID;

-- 11. Modify your query again, this time display the results only for invoices with more than 4 invoicelines.

SELECT 
       InvoiceID , 
       COUNT(InvoiceLineID)
FROM 
     sales.InvoiceLines
WHERE ExtendedPrice > 1000
GROUP BY 
         InvoiceID
HAVING COUNT(InvoiceLineID) > 4;

-- 12. Display the supplierId and ColorID and the average UnitPrice per supplierId and ColorID

SELECT 
       supplierId , 
       ColorID , 
       AVG(UnitPrice)
FROM 
     Warehouse.StockItems
GROUP BY 
         supplierId , 
         ColorID
ORDER BY 
         SupplierID , 
         ColorID DESC;

-- 13. Display the InvoiceID and the highest ExtendedPrice of it's invoiceLines

SELECT 
       InvoiceID , 
       MAX(extendedPrice) , 
       COUNT(InvoiceLineId)
FROM 
     Sales.InvoiceLines
GROUP BY 
         InvoiceID;

-- 14. Modify your query to display the results only for Invoices with more than 4 invoiceLines

SELECT 
       InvoiceID , 
       MAX(extendedPrice) , 
       COUNT(InvoiceLineId)
FROM 
     Sales.InvoiceLines
GROUP BY 
         InvoiceID
HAVING COUNT(InvoiceLineId) > 4;

-- 15. Display the invoiceID together with the sum and average of the extendedPrice of the corresponding InvoiceLines. Only display InvoiceID's for which the sum > 30000

SELECT 
       InvoiceID , 
       SUM(extendedPrice) , 
       AVG(ExtendedPrice)
FROM 
     Sales.InvoiceLines
GROUP BY 
         InvoiceID
HAVING SUM(extendedPrice) > 30000;

-- 16. Display the colorID and the correspondign number of stockingItems. stockItems without color indication can be excluded from the count. Limit the result for colors with a number of items between 5 and 50

SELECT 
       ColorID , 
       COUNT(colorId)
FROM 
     warehouse.StockItems
WHERE ColorID IS NOT NULL
GROUP BY 
         ColorID
HAVING COUNT(colorId) BETWEEN 5 AND 50;