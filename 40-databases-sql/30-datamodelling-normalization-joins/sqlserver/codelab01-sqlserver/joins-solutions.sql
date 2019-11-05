/*
**Exercises solution - Joins**
*/

-- 1. Display the StockItemID, StockItemName and the corresponding color name

SELECT 
       s.StockItemID , 
       s.StockItemName , 
       c.ColorName
FROM 
     Warehouse.StockItems AS s
     LEFT OUTER JOIN Warehouse.Colors AS c ON s.ColorID = c.ColorID;

-- 2. Display the StockItemID, StockItemName and the corresponding color name for items with a color specified

SELECT 
       s.StockItemID , 
       s.StockItemName , 
       c.ColorName
FROM 
     Warehouse.StockItems AS s
     LEFT OUTER JOIN Warehouse.Colors AS c ON s.ColorID = c.ColorID
WHERE s.ColorID IS NOT NULL;

SELECT 
       s.StockItemID , 
       s.StockItemName , 
       c.ColorName
FROM 
     Warehouse.StockItems AS s
     JOIN Warehouse.Colors AS c ON s.ColorID = c.ColorID;

-- 3. Display CustomerId, CustomerName, CategoryName and buying group name 

SELECT 
       cust.CustomerID , 
       cust.CustomerName , 
       cat.CustomerCategoryName , 
       buy.BuyingGroupName
FROM 
     Sales.Customers AS cust
     LEFT OUTER JOIN Sales.CustomerCategories AS cat ON cust.CustomerCategoryID = cat.CustomerCategoryID
     LEFT OUTER JOIN Sales.BuyingGroups AS buy ON cust.BuyingGroupID = buy.BuyingGroupID;

-- 4. Display CustomerId, CustomerName, CategoryName, buying group name and delivery method

SELECT 
       cust.CustomerID , 
       cust.CustomerName , 
       cat.CustomerCategoryName , 
       buy.BuyingGroupName , 
       del.DeliveryMethodName
FROM 
     Sales.Customers AS cust
     LEFT OUTER JOIN Sales.CustomerCategories AS cat ON cust.CustomerCategoryID = cat.CustomerCategoryID
     LEFT OUTER JOIN Sales.BuyingGroups AS buy ON cust.BuyingGroupID = buy.BuyingGroupID
     LEFT OUTER JOIN Application.DeliveryMethods AS del ON cust.DeliveryMethodID = del.DeliveryMethodID;

-- 5. Display the invoiceID, the customer name and the corresponding invoicelines together with their description and extended price for invoice 18832

SELECT 
       i.InvoiceID , 
       cust.CustomerName , 
       il.InvoiceLineID , 
       il.Description , 
       il.ExtendedPrice
FROM 
     Sales.Invoices AS i
     LEFT OUTER JOIN Sales.InvoiceLines AS il ON i.InvoiceID = il.InvoiceID
     LEFT OUTER JOIN sales.Customers AS cust ON cust.CustomerID = i.CustomerID
WHERE i.InvoiceID = 18832;

-- 6. create an overview of all invoices together with their customer name and the sum of extended price of all invoicelines (highest invoice comes first) 

SELECT 
       i.InvoiceID , 
       cust.CustomerName , 
       FORMAT(SUM(il.ExtendedPrice) , 'C')
FROM 
     Sales.Invoices AS i
     LEFT OUTER JOIN Sales.InvoiceLines AS il ON i.InvoiceID = il.InvoiceID
     LEFT OUTER JOIN sales.Customers AS cust ON cust.CustomerID = i.CustomerID
GROUP BY 
         i.InvoiceID , 
         cust.CustomerName
ORDER BY 
         SUM(il.ExtendedPrice) DESC;

-- 7. Display the DeliveryMethodName and the amount of customers using this method

SELECT 
       DeliveryMethodName , 
       COUNT(cust.customerId)
FROM 
     Application.DeliveryMethods AS del
     JOIN sales.Customers AS cust ON del.DeliveryMethodID = cust.DeliveryMethodID
GROUP BY 
         DeliveryMethodName;

-- 8. Modify your query to display DeliveryMethods including those not used by any client

SELECT 
       DeliveryMethodName , 
       COUNT(cust.customerId)
FROM 
     Application.DeliveryMethods AS del
     LEFT OUTER JOIN sales.Customers AS cust ON del.DeliveryMethodID = cust.DeliveryMethodID
GROUP BY 
         DeliveryMethodName;

-- 9. For each stockitem, display the Id, name, supplier name, color name, name of the inner package and name of the outer package

SELECT 
       stock.StockItemID , 
       stock.StockItemName , 
       sup.SupplierName , 
       col.ColorName , 
       Upack.PackageTypeName , 
       Opack.PackageTypeName
FROM 
     Warehouse.StockItems AS stock
     LEFT OUTER JOIN Purchasing.Suppliers AS sup ON sup.SupplierID = stock.SupplierID
     LEFT OUTER JOIN Warehouse.Colors AS col ON col.ColorId = stock.ColorID
     LEFT OUTER JOIN Warehouse.PackageTypes AS Upack ON Upack.PackageTypeID = stock.UnitPackageID
     LEFT OUTER JOIN Warehouse.PackageTypes AS Opack ON Opack.PackageTypeID = stock.OuterPackageID;

-- 10. Modify your query to display only those items that have a color defined

SELECT 
       stock.StockItemID , 
       stock.StockItemName , 
       sup.SupplierName , 
       col.ColorName , 
       Upack.PackageTypeName , 
       Opack.PackageTypeName
FROM 
     Warehouse.StockItems AS stock
     LEFT OUTER JOIN Purchasing.Suppliers AS sup ON sup.SupplierID = stock.SupplierID
     JOIN Warehouse.Colors AS col ON col.ColorId = stock.ColorID
     LEFT OUTER JOIN Warehouse.PackageTypes AS Upack ON Upack.PackageTypeID = stock.UnitPackageID
     LEFT OUTER JOIN Warehouse.PackageTypes AS Opack ON Opack.PackageTypeID = stock.OuterPackageID;

-- 11. Provide an overview of all cities, their state, country, subregion and region

SELECT 
       cit.CityID , 
       cit.CityName , 
       stat.StateProvinceName , 
       c.CountryName , 
       c.Subregion , 
       c.Region
FROM 
     Application.Cities AS cit
     LEFT OUTER JOIN Application.StateProvinces AS stat ON cit.StateProvinceID = stat.StateProvinceID
     LEFT OUTER JOIN Application.Countries AS c ON c.CountryID = stat.CountryID;

-- 12. Display stock items with a unitPrice cheaper than stockitem 187 (using JOIN)

SELECT 
       stock.StockItemID , 
       stock.StockItemName , 
       stock.UnitPrice
FROM 
     Warehouse.StockItems AS stock
     JOIN Warehouse.StockItems AS specific_stock ON stock.UnitPrice < specific_stock.UnitPrice
                                                    AND 
                                                    specific_stock.StockItemID = 187;