/*Functions
=========
*/

--1. Display the PersonID the full name in capitals and the PreferredName lowercase in upper case, for all people whose personId is in the range between 10 and 20.
--2. Display the fullname uppercase and lowercase for all employees whose search name contains 'amy' 
--3. For each supplier, use the CONCAT function to display the supplier name concatenated with the supplier reference.
--4. For each supplier use the CONCAT function to display supplierName and delivery address (DeliveryAddressLine1,DeliveryAddressLine2, and DeliveryPostalCode)
--5. For each person in the people table, try to reconstruct the EmailAddress (preferredName + first letter of last name + '@wideworldimporters.com')
--6. For each person in the people table, create a new EmailAdress (first letter of FullName + 3 last letters of FullName + '@wideworldimporters.com')
--7. Display the preferred name for all persons where it's length is greater than 10 characters ordered by the length descending
--8. For all customers with (203) in their phoneNumber display phone number and a new phone number using the REPLACE function. in the new phone number replace all occurrences of (203) with (204).
--9. For each stockitem, display:
--10. For each customer display customerId, Name, AccountOpenedDate, AccountOpenedDate minus 10 days, AccountOpenedDate plus one month, and the day difference between today and AccountOpenedDate.
--11. For each customer display ID, Name, AccountOpenedDate, number of months he is customer of the company, and number of years he is customer of the company.
--12. For each Customer display CustomerID, CustomerName, AccountOpenedDate and AccountOpenedDate plus one year.
--13. For each customer display the ID, name, AccountOpenedDate, AccountOpenedDate year, and AccountOpenedDate month.
--14. For each customer, display the AccountOpenedDate in the format dd/mm/yyyy
--15. Display the unitprice in format model : ‘$5.00’ of all sotkc items less expensive than 10$
--16. For each customer display customerId, customerName and CreditLimit. If a customer doesn’t have a CreditLimit, display 0 instead of NULL.
--17. For each customer display customerId, customerName and CreditLimit. If a customer doesn’t have a CreditLimit, display "No Limit" instead of NULL.
--18. For each stockitem, display the Id, description, unit price, and a unit price grade based on these conditions:
--    - if the unit price is between 0 and 10 – unit price grade level is A
--    - if the unit price is between 11 and 50 – unit price level is B
--    - if the unit price is between 51 and 100 – unit price level is C
--    - for any other range – unit price level is D