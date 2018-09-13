-- Set operators
-- ===============

-- 1. Provide a single list of all countries and States (column name = "Name") and their type (either Country or State)

select 
CountryName as "Name",
'Country' as "Type"
from Application.Countries
UNION
select 
StateProvinceName as "Name",
'State' as "Type"
from Application.StateProvinces

-- 2. Provide a singe list of FullName and type ('Primary' or 'Alternate') of all contact persons of customer accounts

select 
FullName,
'Primary' as "Type"
from Application.People
where PersonID in (
select PrimaryContactPersonID
from sales.Customers)
UNION ALL
select 
FullName,
'Alternate' as "Type"
from Application.People
where PersonID in (
select AlternateContactPersonID
from sales.Customers)

-- 3. Provide a singe list of StockItemID and StockItemName of those items having colorID 3 and delivered by supplier 4 (using SET operators)

select StockItemID, StockItemName
from Warehouse.StockItems
where ColorID=35
EXCEPT
select StockItemID, StockItemName
from Warehouse.StockItems
where SupplierID =4;

-- 4. Provide a singe list of CustomerID and CustomerName that are in the customers table and in the customers archive 

select CustomerID, CustomerName 
from Sales.Customers
INTERSECT
select CustomerID, CustomerName
from Sales.Customers_Archive;

