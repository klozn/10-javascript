--**Exercises solution**

--1. For each order, display all information

select *
from Sales.Orders;

--2. For each order, display OrderID, CustomerID, SalesPersonID and Order Date

select OrderID, CustomerID, SalespersonPersonID, OrderDate
from Sales.Orders;


--3. For each order, display Order Date, CustomerID, OrderID, SalesPersonID in this exact order

select OrderDate, CustomerID, OrderID, SalespersonPersonID
from Sales.Orders;

--4. For each customer display all information

select *
from Sales.Customers;

--5. For each customer display customer number and Customer name

select CustomerID, CustomerName
from Sales.Customers;

--6. Display customer number and customer name for customer 'Tailspin Toys (Topstone, CT)'

select CustomerID, CustomerName
from Sales.Customers
where CustomerName = 'Tailspin Toys (Topstone, CT)';

--7. Display the OrderID, CustomerID, SalespersonPersonID, OrderDate of all orders made for Tailspin Toys (Topstone, CT)

select OrderID, CustomerID, SalespersonPersonID, OrderDate
from Sales.Orders
where CustomerID=165;

--8. Display the OrderID, CustomerID, SalespersonPersonID, OrderDate of all orders made for Tailspin Toys (Topstone, CT) ordered by date

select OrderID, CustomerID, SalespersonPersonID, OrderDate
from Sales.Orders
where CustomerID=165
order by OrderDate desc;

--9. Display the OrderID, CustomerID, SalespersonPersonID, OrderDate of all orders made for Tailspin Toys (Topstone, CT) ordered by date (oldest date first)

select OrderID, CustomerID, SalespersonPersonID, OrderDate
from Sales.Orders
where CustomerID=165
order by OrderDate asc;

--10. Display the OrderID, CustomerID, SalespersonPersonID, OrderDate of all orders made for Tailspin Toys (Topstone, CT) ordered by date (oldest date first) and OrderId (descending)

select OrderID, CustomerID, SalespersonPersonID, OrderDate
from Sales.Orders
where CustomerID=165
order by OrderDate asc, CustomerID desc;

--11. Display the PersonID, FullName, EmailAddress of the primary contact person of Tailspin Toys (Topstone, CT)

select PrimaryContactPersonID
from sales.Customers
where CustomerName = 'Tailspin Toys (Topstone, CT)';

select PersonID, FullName, EmailAddress
from Application.People
where PersonID = 1329;

--12. Display all tables you have access to in the WideWorldImporters database (tip: INFORMATION_SCHEMA)

SELECT *
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_TYPE = 'BASE TABLE' AND TABLE_CATALOG='WideWorldImporters';

-- FYI: INFORMATION_SCHEMA is SQL server specific

--13. Explore the detail of the columns of of table sales.OrderLines (tip: stored procedure 'sp_columns')

exec sp_columns OrderLines;

-- OR

SELECT *
FROM INFORMATION_SCHEMA.COLUMNS
where TABLE_NAME='OrderLines';

--14. For each city display cityID, CityName, StateProvinceID

select CityID, CityName, StateProvinceID
from Application.Cities;

--15. Display cityID, CityName, StateProvinceID for all cities located in Mississippi

select StateProvinceID
from Application.StateProvinces
where StateProvinceName = 'Mississippi';

select CityID, CityName, StateProvinceID
from Application.Cities
where StateProvinceID=25;

--16. Display CityID, CityName, StateProvinceID of all cities lying in the United States and within the Sales territory 'Far West'

select CountryID, CountryName
from Application.Countries
where CountryName = 'United States';

select StateProvinceID, StateProvinceName, SalesTerritory
from Application.StateProvinces
where CountryID=230 and SalesTerritory='Far West';

select CityID, CityName, StateProvinceID
from Application.Cities
where StateProvinceID in (2,5,12,29,38,50);

