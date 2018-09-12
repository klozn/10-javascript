-- **Exercises**

--1. Display all Orderlines (ID, OrderId, stockItemId, Description) that have an ordered quantity higher then 350

select OrderLineID, OrderID, StockItemID, Description, Quantity
from Sales.Orderlines
where Quantity > 350;

--2. Display all Orderlines (ID, OrderId, stockItemId, Description) that have an ordered quantity different from 1

select OrderLineID, OrderID, StockItemID, Description, Quantity
from Sales.Orderlines
where Quantity <> 1;

--3. Display all Orderlines (ID, OrderId, stockItemId, Description) that have an ordered quantity between 200 and 300
select OrderLineID, OrderID, StockItemID, Description, Quantity
from Sales.Orderlines
where Quantity between 300 and 400;

--4. Display all Orderlines (ID, OrderId, stockItemId, Description) that have an ordered quantityhigher than 200 but a picked quantity smaller than 200

select OrderLineID, OrderID, StockItemID, Description, Quantity, PickedQuantity
from Sales.Orderlines
where Quantity > 200 and PickedQuantity < 200;

--5. Display all Orderlines (ID, OrderId, stockItemId, Description) and the difference between Quantity and PickedQuantity as difference

select OrderLineID, OrderID, StockItemID, Description, Quantity, PickedQuantity, Quantity-PickedQuantity as "difference"
from sales.OrderLines;

--6. Display all Orderlines (ID, OrderId, stockItemId, Description) and the difference between Quantity and PickedQuantity as difference order by the biggest difference descending

select OrderLineID, OrderID, StockItemID, Description, Quantity, PickedQuantity, Quantity-PickedQuantity as "difference"
from sales.OrderLines
order by Quantity-PickedQuantity desc;

--7. Display all Orderlines (ID, OrderId, stockItemId, Description) where the difference is exact 96

select OrderLineID, OrderID, StockItemID, Description, Quantity, PickedQuantity, Quantity-PickedQuantity as "difference"
from sales.OrderLines
where Quantity-PickedQuantity = 96;

--8. Display all invoicelines, the lineprofit and the extended price and the margin in percentage (e.g. Lineprofit=100, ExtendedPrice=200, margin(%)=50)

select InvoiceLineID, LineProfit, ExtendedPrice, round((LineProfit/ExtendedPrice)*100,2) as "Margin"
from sales.InvoiceLines;

--9. Display invoicelines, the lineprofit and the extended price and the margin in percentage (e.g. Lineprofit=100, ExtendedPrice=200, margin(%)=50) where the margin > 70%

select InvoiceLineID, LineProfit, ExtendedPrice, round((LineProfit/ExtendedPrice)*100,2) as "Margin"
from sales.InvoiceLines
where  LineProfit/ExtendedPrice*100 > 70;

--10. Display all customers (ID, name, CustomerCategoryID, DeliveryMethodID, CreditLimit) of category "Supermarket" that have "Delivery Van" as delivery method order by their CreditLimit descencing.


select CustomerID, CustomerName, CustomerCategoryID, DeliveryMethodID, CreditLimit
from sales.Customers
where DeliveryMethodID=3 and CustomerCategoryID=4
order by creditLimit desc;

--11. Display all customers without an alternative contact person.

select CustomerID, CustomerName, AlternateContactPersonID
from sales.Customers
where AlternateContactPersonID is null;


--12. Display all employees with an alternative contact person

select CustomerID, CustomerName, AlternateContactPersonID
from sales.Customers
where AlternateContactPersonID  is not null;

--13. Display all employees with an alternative contact person that belong to buying group Tailspin Toys

select CustomerID, CustomerName, PrimaryContactPersonID,  AlternateContactPersonID
from sales.Customers
where AlternateContactPersonID  is not null
      and BuyingGroupID=2;


--14. Display all Customers for which the name starts with a 'C'

select CustomerID, CustomerName
from sales.Customers
where CustomerName like 'C%';

--15. Display all Customers for which the name has a 'c' as the third character

select CustomerID, CustomerName
from sales.Customers
where CustomerName like '__c%';

--16.  Display all employees for which the name has a 'c' as the last character.

select CustomerID, CustomerName
from sales.Customers
where CustomerName like '%c';

--17.  Display all employees for which the name has a 'c','C' (either lower or uppercase) in their name.

select CustomerID, CustomerName
from sales.Customers
where CustomerName like '%c%'
      OR CustomerName like '%C%';

select CustomerID, CustomerName
from sales.Customers
where lower(CustomerName) like '%c%';

--18. Display all stockitems that contain chocolate in their name

select StockItemID, StockItemName
from Warehouse.StockItems
where StockItemName like '%chocolate%';

--19. Display all stockitems that contain chocolate in their name and have a unit price in the range 8-15

select *
from Warehouse.StockItems
where StockItemName like '%chocolate%'
      and UnitPrice between 8 and 15;

