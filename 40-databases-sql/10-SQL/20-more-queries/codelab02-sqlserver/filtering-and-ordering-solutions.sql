-- 1. Display the FullName and PreferredName of all people with preferredName 'Amy'

select FullName, PreferredName
from Application.People
where PreferredName = 'Amy';

-- 2. Display StockItemID, StockItemName and Size of all stockItems with size M

select  StockItemID, StockItemName, Size
from Warehouse.StockItems
where size = 'M';

-- 3. Display the CustomerID, CustomerName and CreditLimit for customer having a creditlimit higher than 3000

select CustomerID, CustomerName, CreditLimit
from sales.Customers 
where CreditLimit > 3000;

-- 4. Display CustomerID, CustomerName, AccountOpenedDate from customer accounts opned after January 1st, 2016.

select CustomerID, CustomerName, AccountOpenedDate
from sales.Customers
where AccountOpenedDate > convert(datetime, '01-01-2016');

-- 5. Display the StockItemID, StockItemName, ColorID of all stockItems with color 3,12 or 35

select StockItemID, StockItemName, ColorID
from Warehouse.StockItems
where colorID in (3,12,35);			

-- 6. Display the StockItemID, StockItemName, ColorID of all stockItems with color different than 3,12 or 35

select StockItemID, StockItemName, ColorID
from Warehouse.StockItems
where colorID not in (3,12,35);	

-- 7. Display the CountryID, CountryName, Region and Subregion of countries in subregion Northern or Eastern Europe

select CountryID, CountryName, Region, Subregion
from Application.Countries
where Subregion in ('Northern Europe', 'Eastern Europe'); 

-- 8. Display the CustomerID, CustomerName, CreditLimit of all customers whose name ends with an e.

select CustomerID, CustomerName, CreditLimit
from sales.Customers
where CustomerName like '%e';

-- 9. Display the CityID and CityName where the third letter in their name is Y.

select CityID, CityName
from Application.Cities
where CityName like '__y%';

-- 10. Display CountryID, CountryName for all countries who have the letters : L, J, or H in their name. Sort the query in descending order by country name.

select CountryID, CountryName
from Application.Countries
where CountryName like '%L%'
OR CountryName like '%J%'
OR CountryName like '%H%'
order by CountryName desc;

-- 11. Display the CustomerID, CustomerName for all customers whose name doesn’t have the letter a. Sort the query in ascending order by name.

select CustomerID, CustomerName
from sales.Customers
where CustomerName not like '%a%'
order by CustomerName asc;

-- 12. Display all data from stock items with marketing comments

select StockItemID, StockItemName, MarketingComments
from Warehouse.StockItems
where MarketingComments is not null;

-- 13. Display the stock item name concatenated with the brand name, separated by hyphen and unitprice , for all stockitems with a brand whose unitprice  is in the range between 1 and 50. Sort the query in ascending order by the brand name.

select concat(StockItemName,' - ',brand) as "full name", UnitPrice
from Warehouse.StockItems
where brand is not null
and UnitPrice between 1 and 50
order by brand asc;

-- 14. Display 
-- Supplier name and supplier reference in the following format 'A Datum Corporation (AA20384)' named "Supllier"
--  Bank account name, bank account branch and International code as follows "A Datum Corporation-Woodgrove Bank Zionsville (25986)" named "Bank"

select 
concat(SupplierName,' (',SupplierReference,')') as "Supplier",
concat(BankAccountName,' - ', BankAccountBranch,' (',BankInternationalCode,')') as "Bank"
from Purchasing.Suppliers;


-- 15. Display all suppliers where 
--     no delivery method is provided and their bank account branch is 'Woodgrove Bank San Francisco'
--     the bank account branch is 'Woodgrove Bank Karlstad' independent of the delivery method 

select *
from Purchasing.Suppliers
where (DeliveryMethodID is null AND BankAccountBranch like 'Woodgrove Bank San Francisco')
OR (BankAccountBranch like 'Woodgrove Bank Karlstad');


-- 16. Display CustomerID, CustomerName and AccountOpenedDate of customer accounts opened during October 10th, 2013 and January 1, 2014.

select CustomerID, CustomerName, AccountOpenedDate
from sales.Customers
where AccountOpenedDate between convert(date, '2013-10-10') and convert(date, '2014-01-01');


-- 17. Display the StockItemName, StockItemID, TaxRate , UnitPrice and calculcate the "Extended prcice" (Unitprice augmented with it's tax). Sort the query in a descending order by the extended pri e.

select StockItemName, StockItemID, TaxRate , UnitPrice, unitprice*(1+taxrate/100) as "Extended price",
from Warehouse.StockItems
where StockItemName like '%chocolate%'
order by unitprice*(1+taxrate/100) desc;


-- 18. Display the InvoiceLineID, Description and ExtendedPrice of all invoice lines with an extended price higher of equal than 5152 ordered by extended price ascencding

select InvoiceLineID, Description, ExtendedPrice
from Sales.InvoiceLines
where ExtendedPrice >= 5152
order by ExtendedPrice asc;


-- 19. Display the StockItemID, StockItemName and ColorID for all  stockitems whose colorId is equal to 12, 3 or 35
--     - Perform this exercise once by using the IN operator
--     - Perform this exercise once by using the OR operator

select StockItemID, StockItemName, ColorID
from Warehouse.StockItems
where ColorID in (12, 3, 35);

select StockItemID, StockItemName, ColorID
from Warehouse.StockItems
where ColorID = 12
or ColorID =3
or ColorID= 35;

-- 20. Display the PurchaseOrderID, SupplierID for all purchase orders without comments

select PurchaseOrderID, SupplierID
from Purchasing.PurchaseOrders
where comments is null;


-- 21. Display the CustomerID and CustomerName with a creditlimit.

select CustomerID, CustomerName
from sales.Customers
where creditlimit is not null;