**Exercises - filtering and ordering**


-- 1. Display the FullName and PreferredName of all people with preferredName 'Amy'
-- 2. Display StockItemID, StockItemName and Size of all stockItems with size M
-- 3. Display the CustomerID, CustomerName and CreditLimit for customer having a creditlimit higher than 3000
-- 4. Display CustomerID, CustomerName, AccountOpenedDate from customer accounts opned after January 1st, 2016.
-- 5. Display the StockItemID, StockItemName, ColorID of all stockItems with color 3,12 or 35
-- 6. Display the StockItemID, StockItemName, ColorID of all stockItems with color different than 3,12 or 35
-- 7. Display the CountryID, CountryName, Region and Subregion of countries in subregion Northern or Eastern Europe
-- 8. Display the CustomerID, CustomerName, CreditLimit of all customers whose name ends with an e.
-- 9. Display the CityID and CityName where the third letter in their name is Y.
-- 10. Display CountryID, CountryName for all countries who have the letters : L, J, or H in their name. Sort the query in descending order by country name.
-- 11. Display the CustomerID, CustomerName for all customers whose name doesn’t have the letter a. Sort the query in ascending order by name.
-- 12. Display all data from stock items with marketing comments
-- 13. Display the stock item name concatenated with the brand name, separated by hyphen and unitprice , for all stockitems with a brand whose unitprice  is in the range between 1 and 50. Sort the query in ascending order by the brand name.
-- 14. Display 
-- Supplier name and supplier reference in the following format 'A Datum Corporation (AA20384)' named "Supllier"
-- Bank account name, bank account branch and International code as follows "A Datum Corporation-Woodgrove Bank Zionsville (25986)" named "Bank"
-- 15. Display all suppliers where 
-- no delivery method is provided and their bank account branch is 'Woodgrove Bank San Francisco'
-- the bank account branch is 'Woodgrove Bank Karlstad' independent of the delivery method 
-- 16. Display CustomerID, CustomerName and AccountOpenedDate of customer accounts opened during October 10th, 2013 and January 1, 2014.
-- 17. Display the StockItemName, StockItemID, TaxRate , UnitPrice and calculcate the "Extended prcice" (Unitprice augmented with it's tax). Sort the query in a descending order by the extended pri e.
-- 18. Display the InvoiceLineID, Description and ExtendedPrice of all invoice lines with an extended price higher of equal than 5152 ordered by extended price ascencding
-- 19. Display the StockItemID, StockItemName and ColorID for all  stockitems whose colorId is equal to 12, 3 or 35
-- Perform this exercise once by using the IN operator
-- Perform this exercise once by using the OR operator
-- 20. Display the PurchaseOrderID, SupplierID for all purchase orders without comments
-- 21. Display the CustomerID and CustomerName with a creditlimit.