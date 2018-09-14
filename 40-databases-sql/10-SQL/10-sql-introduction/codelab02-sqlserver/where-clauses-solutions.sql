/*
**Exercises solution - where clauses**
*/

--1. Display all Orderlines (ID, OrderId, stockItemId, Description) that have an ordered quantity higher then 350

SELECT 
       OrderLineID , 
       OrderID , 
       StockItemID , 
       Description , 
       Quantity
FROM 
     Sales.Orderlines
WHERE Quantity > 350;

--2. Display all Orderlines (ID, OrderId, stockItemId, Description) that have an ordered quantity different from 1

SELECT 
       OrderLineID , 
       OrderID , 
       StockItemID , 
       Description , 
       Quantity
FROM 
     Sales.Orderlines
WHERE Quantity <> 1;

--3. Display all Orderlines (ID, OrderId, stockItemId, Description) that have an ordered quantity between 200 and 300

SELECT 
       OrderLineID , 
       OrderID , 
       StockItemID , 
       Description , 
       Quantity
FROM 
     Sales.Orderlines
WHERE Quantity BETWEEN 300 AND 400;

--4. Display all Orderlines (ID, OrderId, stockItemId, Description) that have an ordered quantityhigher than 200 but a picked quantity smaller than 200

SELECT 
       OrderLineID , 
       OrderID , 
       StockItemID , 
       Description , 
       Quantity , 
       PickedQuantity
FROM 
     Sales.Orderlines
WHERE Quantity > 200
      AND 
      PickedQuantity < 200;

--5. Display all Orderlines (ID, OrderId, stockItemId, Description) and the difference between Quantity and PickedQuantity as difference

SELECT 
       OrderLineID , 
       OrderID , 
       StockItemID , 
       Description , 
       Quantity , 
       PickedQuantity , 
       Quantity - PickedQuantity AS "difference"
FROM 
     sales.OrderLines;

--6. Display all Orderlines (ID, OrderId, stockItemId, Description) and the difference between Quantity and PickedQuantity as difference order by the biggest difference descending

SELECT 
       OrderLineID , 
       OrderID , 
       StockItemID , 
       Description , 
       Quantity , 
       PickedQuantity , 
       Quantity - PickedQuantity AS "difference"
FROM 
     sales.OrderLines
ORDER BY 
         Quantity - PickedQuantity DESC;

--7. Display all Orderlines (ID, OrderId, stockItemId, Description) where the difference is exact 96

SELECT 
       OrderLineID , 
       OrderID , 
       StockItemID , 
       Description , 
       Quantity , 
       PickedQuantity , 
       Quantity - PickedQuantity AS "difference"
FROM 
     sales.OrderLines
WHERE Quantity - PickedQuantity = 96;

--8. Display all invoicelines, the lineprofit and the extended price and the margin in percentage (e.g. Lineprofit=100, ExtendedPrice=200, margin(%)=50)

SELECT 
       InvoiceLineID , 
       LineProfit , 
       ExtendedPrice , 
       ROUND( ( LineProfit / ExtendedPrice ) * 100 , 2) AS "Margin"
FROM 
     sales.InvoiceLines;

--9. Display invoicelines, the lineprofit and the extended price and the margin in percentage (e.g. Lineprofit=100, ExtendedPrice=200, margin(%)=50) where the margin > 70%

SELECT 
       InvoiceLineID , 
       LineProfit , 
       ExtendedPrice , 
       ROUND( ( LineProfit / ExtendedPrice ) * 100 , 2) AS "Margin"
FROM 
     sales.InvoiceLines
WHERE LineProfit / ExtendedPrice * 100 > 70;

--10. Display all customers (ID, name, CustomerCategoryID, DeliveryMethodID, CreditLimit) of category "Supermarket" that have "Delivery Van" as delivery method order by their CreditLimit descencing.

SELECT 
       CustomerID , 
       CustomerName , 
       CustomerCategoryID , 
       DeliveryMethodID , 
       CreditLimit
FROM 
     sales.Customers
WHERE DeliveryMethodID = 3
      AND 
      CustomerCategoryID = 4
ORDER BY 
         creditLimit DESC;

--11. Display all customers without an alternative contact person.

SELECT 
       CustomerID , 
       CustomerName , 
       AlternateContactPersonID
FROM 
     sales.Customers
WHERE AlternateContactPersonID IS NULL;

--12. Display all employees with an alternative contact person

SELECT 
       CustomerID , 
       CustomerName , 
       AlternateContactPersonID
FROM 
     sales.Customers
WHERE AlternateContactPersonID IS NOT NULL;

--13. Display all employees with an alternative contact person that belong to buying group Tailspin Toys

SELECT 
       CustomerID , 
       CustomerName , 
       PrimaryContactPersonID , 
       AlternateContactPersonID
FROM 
     sales.Customers
WHERE AlternateContactPersonID IS NOT NULL
      AND 
      BuyingGroupID = 2;

--14. Display all Customers for which the name starts with a 'C'

SELECT 
       CustomerID , 
       CustomerName
FROM 
     sales.Customers
WHERE CustomerName LIKE 'C%';

--15. Display all Customers for which the name has a 'c' as the third character

SELECT 
       CustomerID , 
       CustomerName
FROM 
     sales.Customers
WHERE CustomerName LIKE '__c%';

--16.  Display all employees for which the name has a 'c' as the last character.

SELECT 
       CustomerID , 
       CustomerName
FROM 
     sales.Customers
WHERE CustomerName LIKE '%c';

--17.  Display all employees for which the name has a 'c','C' (either lower or uppercase) in their name.

SELECT 
       CustomerID , 
       CustomerName
FROM 
     sales.Customers
WHERE CustomerName LIKE '%c%'
      OR 
      CustomerName LIKE '%C%';

SELECT 
       CustomerID , 
       CustomerName
FROM 
     sales.Customers
WHERE LOWER(CustomerName) LIKE '%c%';

--18. Display all stockitems that contain chocolate in their name

SELECT 
       StockItemID , 
       StockItemName
FROM 
     Warehouse.StockItems
WHERE StockItemName LIKE '%chocolate%';

--19. Display all stockitems that contain chocolate in their name and have a unit price in the range 8-15

SELECT 
       *
FROM 
     Warehouse.StockItems
WHERE StockItemName LIKE '%chocolate%'
      AND 
      UnitPrice BETWEEN 8 AND 15;