# SQL
e SQL developer
**Oracle 11g Express Edition (XE)**

Oracle Database XE is an entry-level, small-footprint database based on the Oracle Database 11g Release 2 code base.  It's free to develop, deploy, and distribute; fast to download; and simple to administer.

**Oracle SQL Developer**

SQL Developer is an Integrated development environment (IDE) for working with SQL in Oracle databases. Oracle Corporation provides this product free; it uses the Java Development Kit.

*Oracle Database XE comes with a sample database user named HR. 
This user owns several database tables in a sample schema for a fictional Human Resources department. 
However, for security reasons, this user's account is locked. 
You need to unlock this account before you can view the HR objects or build any applications that use these objects.* 

- Download Oracle 11g XE database (you'll need an oracle account)
- Install the Oracle 11g XE database (user:SYSTEM password:SYSTEM )
- Download and install Oracle
- Create a new connection in SQL developer to your local Oracle XE using the SYSTEM user
- Unlock the HR user (can be found under Other Users)
- Disconnect the SYSTEM user
- Create a new connection using the HR user

*Tip!* Oracle Database Express Edition Getting Started Guide

**Exercises**

1. For each employee, display all information
2. For each employee, display ID, first name, last name, department number
3. For each employee, display department number, ID, first name, last name in this exact order
4. For each department display all information
5. For each department display department number and department name
6. Display the department number and department name for the 'Shipping' department
7. Display the ID, first name, last name and department number for employees working for the shipping department
8. Display the ID, first name, last name and department number for employees working for the shipping department ordered by last name (a-z)
9. Display the ID, first name, last name and department number for employees working for the shipping department ordered by last name (z-a)
10. Display the ID, first name, last name and department number for employees working for the shipping department ordered by last name and first name (a-z)
11. Display the ID, first name and last name of the manager of the shipping department
12. For each user table you have access to display all information  (tip: user_tables)
13. Explore all tables (tip: describe table_name)  
14. For each location display ID, city, state and country code
15. Display ID, city, state and country code for locations in the United Kingdom
16. Display the department number and department name for departments located in the United Kingdom
17. Display the ID, first name, last name for all employees working for a department in the United Kingdom

![HR tables](https://github.com/cegeka/switchfully/blob/master/03-databases/01-SQL/01-sql-introduction/codelab01/hrtables.gif)


