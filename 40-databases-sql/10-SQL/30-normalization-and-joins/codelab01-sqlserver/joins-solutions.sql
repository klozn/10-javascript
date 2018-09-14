/*
Joins
=====
*/

-- 1. Display the StockItemID, StockItemName and the corresponding color name

select s.StockItemID, s.StockItemName, c.ColorName
from Warehouse.StockItems s 
left outer join Warehouse.Colors c on s.ColorID=c.ColorID

-- 2. Display the StockItemID, StockItemName and the corresponding color name for items with a color specified

select s.StockItemID, s.StockItemName, c.ColorName
from Warehouse.StockItems s 
left outer join Warehouse.Colors c on s.ColorID=c.ColorID
where s.ColorID is not null; 

select s.StockItemID, s.StockItemName, c.ColorName
from Warehouse.StockItems s 
join Warehouse.Colors c on s.ColorID=c.ColorID; 

-- 3. Display CustomerId, CustomerName, CategoryName and buying group name 

select cust.CustomerID, cust.CustomerName, cat.CustomerCategoryName, buy.BuyingGroupName
from Sales.Customers cust
left outer join Sales.CustomerCategories cat on cust.CustomerCategoryID=cat.CustomerCategoryID
left outer join Sales.BuyingGroups buy on cust.BuyingGroupID=buy.BuyingGroupID;

-- 4. Display CustomerId, CustomerName, CategoryName, buying group name and delivery method

select cust.CustomerID, cust.CustomerName, cat.CustomerCategoryName, buy.BuyingGroupName, del.DeliveryMethodName
from Sales.Customers cust
left outer join Sales.CustomerCategories cat on cust.CustomerCategoryID=cat.CustomerCategoryID
left outer join Sales.BuyingGroups buy on cust.BuyingGroupID=buy.BuyingGroupID
left outer join Application.DeliveryMethods del on cust.DeliveryMethodID=del.DeliveryMethodID;

-- 5. Display the invoiceID, the customer name and the corresponding invoicelines together with their description and extended price for invoice 18832

select i.InvoiceID, cust.CustomerName, il.InvoiceLineID, il.Description, il.ExtendedPrice
from Sales.Invoices i
left outer join Sales.InvoiceLines il on i.InvoiceID=il.InvoiceID
left outer join sales.Customers cust on cust.CustomerID=i.CustomerID
where i.InvoiceID=18832;

-- 6. create an overview of all invoices together with their customer name and the sum of extended price of all invoicelines (highest invoice comes first) 

select i.InvoiceID, cust.CustomerName, FORMAT(sum(il.ExtendedPrice), 'C')
from Sales.Invoices i
left outer join Sales.InvoiceLines il on i.InvoiceID=il.InvoiceID
left outer join sales.Customers cust on cust.CustomerID=i.CustomerID
group by i.InvoiceID, cust.CustomerName
order by sum(il.ExtendedPrice) desc;


-- 7. Display the DeliveryMethodName and the amount of customers using this method

select DeliveryMethodName, count(cust.customerId)
from Application.DeliveryMethods del
join sales.Customers cust on del.DeliveryMethodID=cust.DeliveryMethodID
group by DeliveryMethodName;

-- 8. Modify your query to display DeliveryMethods including those not used by any client

select DeliveryMethodName, count(cust.customerId)
from Application.DeliveryMethods del
left outer join sales.Customers cust on del.DeliveryMethodID=cust.DeliveryMethodID
group by DeliveryMethodName;

-- 9. For each stockitem, display the Id, name, supplier name, color name, name of the inner package and name of the outer package

select stock.StockItemID, stock.StockItemName, sup.SupplierName, col.ColorName, Upack.PackageTypeName, Opack.PackageTypeName
from Warehouse.StockItems stock
left outer join Purchasing.Suppliers sup on sup.SupplierID=stock.SupplierID
left outer join Warehouse.Colors col on col.ColorId=stock.ColorID
left outer join Warehouse.PackageTypes Upack on Upack.PackageTypeID=stock.UnitPackageID
left outer join Warehouse.PackageTypes Opack on Opack.PackageTypeID=stock.OuterPackageID;

-- 10. Modify your query to display only those items that have a color defined

select stock.StockItemID, stock.StockItemName, sup.SupplierName, col.ColorName, Upack.PackageTypeName, Opack.PackageTypeName
from Warehouse.StockItems stock
left outer join Purchasing.Suppliers sup on sup.SupplierID=stock.SupplierID
join Warehouse.Colors col on col.ColorId=stock.ColorID
left outer join Warehouse.PackageTypes Upack on Upack.PackageTypeID=stock.UnitPackageID
left outer join Warehouse.PackageTypes Opack on Opack.PackageTypeID=stock.OuterPackageID;

-- 11. Provide an overview of all cities, their state, country, subregion and region

select cit.CityID, cit.CityName, stat.StateProvinceName, c.CountryName, c.Subregion, c.Region
from Application.Cities cit
left outer join Application.StateProvinces stat on cit.StateProvinceID=stat.StateProvinceID
left outer join Application.Countries c on c.CountryID=stat.CountryID;

-- 12. Display stock items with a unitPrice cheaper than stockitem 187 (using JOIN)

select stock.StockItemID, stock.StockItemName, stock.UnitPrice
from Warehouse.StockItems stock
join Warehouse.StockItems specific_stock on stock.UnitPrice < specific_stock.UnitPrice and specific_stock.StockItemID=187;