/*
**Exercises solution - functions**
*/

--1. Display the PersonID the full name in capitals and the PreferredName lowercase in upper case, for all people whose personId is in the range between 10 and 20.

SELECT 
       PersonID , 
       UPPER(fullname) , 
       LOWER(PreferredName)
FROM 
     Application.People
WHERE personId BETWEEN 10 AND 20;

--2. Display the fullname uppercase and lowercase for all employees whose search name contains 'amy' 

SELECT 
       UPPER(FullName) AS "FULLNAME" , 
       LOWER(FullName) AS "fullname"
FROM 
     Application.people
WHERE SearchName LIKE '%amy%';

--3. For each supplier, use the CONCAT function to display the supplier name concatenated with the supplier reference.

SELECT 
       concat(SupplierName , ' - ' , SupplierReference) AS "Supplier"
FROM 
     Purchasing.Suppliers;

--4. For each supplier use the CONCAT function to display supplierName and delivery address (DeliveryAddressLine1,DeliveryAddressLine2, and DeliveryPostalCode)

SELECT 
       SupplierName , 
       concat(DeliveryAddressLine1 , ', ' , DeliveryAddressLine2 , ', ' , DeliveryPostalCode) AS "delivery address"
FROM 
     Purchasing.Suppliers;

--5. For each person in the people table, try to reconstruct the EmailAddress (preferredName + first letter of last name + '@wideworldimporters.com')

SELECT 
       FullName , 
       concat(LOWER(PreferredName) , LOWER(SUBSTRING(fullname , CHARINDEX(' ' , fullName)+1 , 1)) , '@wideworldimporters.com') , 
       EmailAddress
FROM 
     Application.People;

--6. For each person in the people table, create a new EmailAdress (first letter of FullName + 3 last letters of FullName + '@wideworldimporters.com')

SELECT 
       FullName , 
       concat(LOWER(SUBSTRING(FullName , 1 , 1)) , LOWER(SUBSTRING(FullName , LEN(FullName)-2 , 3)) , '@wideworldimporters.com') AS "EmailAddress"
FROM 
     Application.People;

--7. Display the preferred name for all persons where it's length is greater than 10 characters ordered by the length descending

SELECT 
       PreferredName
FROM 
     Application.People
WHERE LEN(PreferredName) > 10
ORDER BY 
         LEN(PreferredName) DESC;

--8. For all customers with (203) in their phoneNumber display phone number and a new phone number using the REPLACE function. in the new phone number replace all occurrences of (203) with (204).

SELECT 
       PhoneNumber , 
       REPLACE(PhoneNumber , ( 203 ) , ( 204 ) )
FROM 
     sales.Customers
WHERE PhoneNumber LIKE '%(203)%';

--9. For each stockitem, display:
--   stockItemID,
--   UnitPrice
--   UnitPricea after a raise of 12,34%
--  UnitPrice after a raise of 12,34%,  rounded to the nearest whole number.
--   UnitPrice after a raise of 12,34%, round down to a whole number.

SELECT 
       StockItemID , 
       UnitPrice , 
       UnitPrice * 1.1234 AS            "simple raise" , 
       ROUND(UnitPrice * 1.1234 , 0) AS "rounded raise" , 
       FLOOR(UnitPrice * 1.1234) AS     "floored raise"
FROM 
     Warehouse.StockItems;

--10. For each customer display customerId, Name, AccountOpenedDate, AccountOpenedDate minus 10 days, AccountOpenedDate plus one month, and the day difference between today and AccountOpenedDate.

SELECT 
       CustomerID , 
       CustomerName , 
       AccountOpenedDate , 
       DATEADD(day , -10 , AccountOpenedDate) , 
       DATEADD(month , 1 , AccountOpenedDate) , 
       DATEDIFF(day , AccountOpenedDate , GETDATE())
FROM 
     sales.Customers;

--11. For each customer display ID, Name, AccountOpenedDate, number of months he is customer of the company, and number of years he is customer of the company.

SELECT 
       CustomerID , 
       CustomerName , 
       AccountOpenedDate , 
       DATEDIFF(month , AccountOpenedDate , GETDATE()) AS "months" , 
       DATEDIFF(year , AccountOpenedDate , GETDATE()) AS  "Years"
FROM 
     sales.Customers;

--12. For each Customer display CustomerID, CustomerName, AccountOpenedDate and AccountOpenedDate plus one year.

SELECT 
       CustomerID , 
       CustomerName , 
       AccountOpenedDate , 
       DATEADD(year , 1 , AccountOpenedDate)
FROM 
     Sales.Customers;

--13. For each customer display the ID, name, AccountOpenedDate, AccountOpenedDate year, and AccountOpenedDate month.

SELECT 
       CustomerID , 
       CustomerName , 
       AccountOpenedDate , 
       DATEPART(day , AccountOpenedDate) , 
       DATEPART(month , AccountOpenedDate) , 
       DATEPART(year , AccountOpenedDate)
FROM 
     Sales.Customers;

--14. For each customer, display the AccountOpenedDate in the format dd/mm/yyyy

SELECT 
       AccountOpenedDate , 
       CONVERT(VARCHAR , AccountOpenedDate , 103)
FROM 
     sales.Customers;

--15. Display the unitprice in format model : ‘$5.00’ of all sotkc items less expensive than 10$

SELECT 
       unitprice , 
       FORMAT(unitprice , 'C')
FROM 
     Warehouse.StockItems
WHERE unitprice < 10;

--16. For each customer display customerId, customerName and CreditLimit. If a customer doesn’t have a CreditLimit, display 0 instead of NULL.

SELECT 
       customerId , 
       customerName , 
       isnull(CreditLimit , 0) AS "CreditLimit"
FROM 
     sales.Customers;

--17. For each customer display customerId, customerName and CreditLimit. If a customer doesn’t have a CreditLimit, display "No Limit" instead of NULL.

SELECT 
       customerId , 
       customerName , 
       isnull(CONVERT(VARCHAR , CreditLimit) , 'No limit') AS "CreditLimit"
FROM 
     sales.Customers;

--18. For each stockitem, display the Id, description, unit price, and a unit price grade based on these conditions:
--    - if the unit price is between 0 and 10 – unit price grade level is A
--    - if the unit price is between 11 and 50 – unit price level is B
--    - if the unit price is between 51 and 100 – unit price level is C
--    - for any other range – unit price level is D

SELECT 
       unitprice ,
       CASE
           WHEN unitprice BETWEEN 0 AND 10
           THEN 'A'
           WHEN unitprice BETWEEN 11 AND 50
           THEN 'B'
           WHEN unitprice BETWEEN 51 AND 100
           THEN 'C'
           ELSE 'D'
       END AS "RANKS"
FROM 
     Warehouse.StockItems;