/*
#SQL

**Exercises**
*/

--**Exercises solution**

-- 1. Display the StockItem ID, Name and unit price of all stock items with a unit price higher than item 73.

select StockItemID, StockItemName, UnitPrice
from Warehouse.StockItems
where UnitPrice > (select UnitPrice
from Warehouse.StockItems
where StockItemID=73);

-- 2. Display the city ID, Name and State of cities in the same State as 'Abie'

select CityID, CityName, StateProvinceID
from Application.Cities
where StateProvinceID = (
select StateProvinceID
from Application.Cities
where CityName like 'Abie');


-- 3. Display the CustomerID, CustomerName and AccountOpenedDate from all customers accounts opened after Customer 'Jibek Juniskyzy'

select CustomerID, CustomerName, AccountOpenedDate
from sales.Customers
where AccountOpenedDate > (select AccountOpenedDate
from sales.Customers where CustomerName = 'Jibek Juniskyzy');


-- 4. Display the CustomerID, CustomerName and CustomerCategoryID of all customers of the type 'Gift Store'

select CustomerID, CustomerName, CustomerCategoryID
from sales.Customers
where CustomerCategoryID =
(select CustomerCategoryID
from sales.CustomerCategories
where CustomerCategoryName = 'Gift Store');

-- 5. Display the CustomerID, CustomerName and DeliveryCityID of all customers located in city 'Akhiok'

select CustomerID, CustomerName, DeliveryCityID
from sales.Customers
where DeliveryCityID = (select CityID
from Application.Cities
where CityName like 'Akhiok');

-- 6. Display the InvoiceLineID, InvoiceID, StockItemID and Description of all invoice lines on the same invoice as InvoiceLineID 5

select InvoiceLineID, InvoiceID, StockItemID, Description
from sales.Invoicelines
where InvoiceID = (
select InvoiceID
from sales.InvoiceLines
where InvoiceLineID=5);

-- 7. Display the StockItemID, StockItemName, UnitPrice of all stockItems with a unitprice higher than the average unitprice

select StockItemID, StockItemName, UnitPrice
from Warehouse.StockItems
where UnitPrice > ( select avg(UnitPrice)
from Warehouse.StockItems);

-- 8. Display the StockItemID, StockItemName, UnitPrice and brand of all unbranded stockItems with a price equal to one of the stockitems of the brand 'Northwind' 

select StockItemID, StockItemName, UnitPrice, brand 
from Warehouse.StockItems
where UnitPrice in (select UnitPrice
from Warehouse.StockItems
where brand like 'Northwind')
and brand is null;

-- 9. Display the StockItemID, StockItemName and UnitPrice of all stock items more expensive than all of the items delivered by supplier with ID 12
select StockItemID, StockItemName, UnitPrice
from Warehouse.StockItems
where UnitPrice > ALL (select UnitPrice
from Warehouse.StockItems
where SupplierID=12);

-- 10. Display the StockItemID, StockItemName and UnitPrice of all stock items more expensive than the most expensive item delivered by supplier with ID 12

select StockItemID, StockItemName, UnitPrice
from Warehouse.StockItems
where UnitPrice > (select max(UnitPrice)
from Warehouse.StockItems
where SupplierID=12);


-- 11. Display the StockItemID, StockItemName and UnitPrice of all stock items less expensive than the least expensive item delivered by supplier with ID 12

select StockItemID, StockItemName, UnitPrice
from Warehouse.StockItems
where UnitPrice < (select min(UnitPrice)
from Warehouse.StockItems
where SupplierID=12);

-- 12. Display CustomerID, CustomerName and DeliveryCityID of all customers of which the delivery city lies within state Alabama

select CustomerID, CustomerName, DeliveryCityID
from sales.Customers
where DeliveryCityID in (
select CityID
from Application.Cities 
where StateProvinceID in (select StateProvinceID
from Application.StateProvinces
where StateProvinceName like 'Alabama'));

-- 13. Display the StockItemID, StockItemName, ColorID and UnitPrice of sotkc items more expensive than the average item delivered by supllier with ID 5 and that have the same color as the item 'Developer joke mug - Oct 31 = Dec 25 (Black)'

select StockItemID, StockItemName, ColorID, UnitPrice
from Warehouse.StockItems
where UnitPrice > (select avg(unitprice)
from Warehouse.StockItems
where supplierID=5)
and ColorID = (select ColorID
from Warehouse.StockItems
where StockItemName like 'Developer joke mug - Oct 31 = Dec 25 (Black)');