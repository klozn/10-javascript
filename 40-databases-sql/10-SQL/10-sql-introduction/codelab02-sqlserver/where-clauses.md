**Exercises - where clauses**

1. Display all Orderlines (ID, OrderId, stockItemId, Description) that have an ordered quantity higher then 350
2. Display all Orderlines (ID, OrderId, stockItemId, Description) that have an ordered quantity different from 1
3. Display all Orderlines (ID, OrderId, stockItemId, Description) that have an ordered quantity between 200 and 300
4. Display all Orderlines (ID, OrderId, stockItemId, Description) that have an ordered quantityhigher than 200 but a picked quantity smaller than 200
5. Display all Orderlines (ID, OrderId, stockItemId, Description) and the difference between Quantity and PickedQuantity as difference
6. Display all Orderlines (ID, OrderId, stockItemId, Description) and the difference between Quantity and PickedQuantity as difference order by the biggest difference descending
7. Display all Orderlines (ID, OrderId, stockItemId, Description) where the difference is exact 96
8. Display all invoicelines, the lineprofit and the extended price and the margin in percentage (e.g. Lineprofit=100, ExtendedPrice=200, margin(%)=50)
9. Display invoicelines, the lineprofit and the extended price and the margin in percentage (e.g. Lineprofit=100, ExtendedPrice=200, margin(%)=50) where the margin > 70%
10. Display all customers (ID, name, CustomerCategoryID, DeliveryMethodID, CreditLimit) of category "Supermarket" that have "Delivery Van" as delivery method order by their CreditLimit descencing. 
11. Display all customers without an alternative contact person.
12. Display all employees with an alternative contact person
13. Display all employees with an alternative contact person that belong to buying group Tailspin Toys
14. Display all Customers for which the name starts with a 'C'
15. Display all Customers for which the name has a 'c' as the third character
16. Display all employees for which the name has a 'c' as the last character.
17. Display all employees for which the name has a 'c','C' (either lower or uppercase) in their name.
18. Display all stockitems that contain chocolate in their name
19. Display all stockitems that contain chocolate in their name and have a unit price in the range 8-15