/*
Group functions
===============
*/


-- 1. Display the CustomerName of the first Customer if sorted alphabetically by CustomerName.

select min(CustomerName)
from Sales.Customers

-- 2. Display the CustomerName of the last Customer if sorted alphabetically by CustomerName.

select max(CustomerName)
from Sales.Customers

-- 3. Display the number of rows in Customers table.

select count(CustomerID)
from Sales.Customers;

-- 4. Display the number of values (exclude NULLs) in CreditLimit column.

select count(CreditLimit)
from Sales.Customers;

-- 5. Display the number of NULL values in commission_pct column.

select count(customerID) -count(CreditLimit)
from Sales.Customers;


-- 6. Display the highest, lowest, and average UnitPrice of StockItems

select min(UnitPrice), max(UnitPrice), avg(UnitPrice)
from Warehouse.StockItems;

-- 7. Display the SupplierID and the average unitprice of the items delivered by the supplier

select SupplierID, avg(UnitPrice)
from Warehouse.StockItems
group by SupplierID;

-- 8. Modify your query to display the results only for departments 50 or 80.

select SupplierID, avg(UnitPrice)
from Warehouse.StockItems
WHERE SupplierID IN (10, 12)
group by SupplierID;

-- 9. Display the InvoiceID and the number of Invoice lines for each InvoiceID.

select InvoiceID, count(InvoiceLineID)
from sales.InvoiceLines
group by InvoiceID;

-- 10. Modify your query to display the results only for Invoice lines with an ExtendedPrice higher than 1000

select InvoiceID, count(InvoiceLineID)
from sales.InvoiceLines
where ExtendedPrice > 1000
group by InvoiceID;

-- 11. Modify your query again, this time display the results only for invoices with more than 4 invoicelines.

select InvoiceID, count(InvoiceLineID)
from sales.InvoiceLines
where ExtendedPrice > 1000
group by InvoiceID
having count(InvoiceLineID) > 4;

-- 12. Display the supplierId and ColorID and the average UnitPrice per supplierId and ColorID

select supplierId, ColorID, avg(UnitPrice)
from Warehouse.StockItems
group by supplierId, ColorID
order by SupplierID, ColorID desc;

-- 13. Display the InvoiceID and the highest ExtendedPrice of it's invoiceLines

select InvoiceID, max(extendedPrice), count(InvoiceLineId)
from Sales.InvoiceLines
group by InvoiceID;

-- 14. Modify your query to display the results only for Invoices with more than 4 invoiceLines

select InvoiceID, max(extendedPrice), count(InvoiceLineId)
from Sales.InvoiceLines
group by InvoiceID
having count(InvoiceLineId) >4;


-- 15. Display the invoiceID together with the sum and average of the extendedPrice of the corresponding InvoiceLines. Only display InvoiceID's for which the sum > 30000

select InvoiceID, sum(extendedPrice), avg(ExtendedPrice)
from Sales.InvoiceLines
group by InvoiceID
having sum(extendedPrice) > 30000;


-- 16. Display the colorID and the correspondign number of stockingItems. stockItems without color indication can be excluded from the count. Limit the result for colors with a number of items between 5 and 50

select ColorID, count(colorId)
from warehouse.StockItems
where ColorID is not null
group by ColorID
having count(colorId) between 5 and 50;