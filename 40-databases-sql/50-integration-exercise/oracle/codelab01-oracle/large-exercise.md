# Large exercise


**freelancer overview excel**

Mark runs a small webdevelopment company. In short he looks for customers who need some help finishing certain projects. when starting a project Mark makes an estimation of the number of days needed to finish the projects.
Next he works with freelancers, who work on these projects for him. Each of them log their hours by day and project. He pays them by the hour (freelancers have an hourly rate).

Mark keeps track of his project and freelancers in an excel sheet sample_data.xlsx


- Create a datamodel (3NF) on paper
- Create a new user for yourself (using the SYSTEM user)
```sql
CREATE USER WEB IDENTIFIED BY password;
GRANT CREATE SESSION TO WEB;
GRANT CREATE TABLE TO WEB;
ALTER DATABASE DEFAULT TABLESPACE users;
GRANT UNLIMITED TABLESPACE TO WEB;
```
- Create the datamodel (tables + constraints) in your Oracle XE DB using this new user 
- populate the newly created datamodel with the data from the excel sheet
- Create the reports requested below

**Exercises**

1. Provide an overview of all freelancers and their hourly price, daily price (8hours) and their address info (including state, zip, ...) ordered by price
2. Provide an overview of all projects (ID, Name) and their customers (including address info)
3. Provide an overview of all worklogs (date and hours, days (8h)), including freelancer name and project name
4. Provide an overview of all projects, their estimation and the amount of days actually spent
5. Provide an overview of all projects, their estimation, the amount of days spent and the over/underspent in percentage
6. Provide an overview of all projects, and their actual cost (payed to freelancers)
7. Calculate the average freelance price
8. Provide an overview of all projects, their estimation, and income based on: estimation * (average hourly freelance price + 10% margin) *8
9. Provide an overview of all freelancers and their total time spent on all projects in days
10. Provide an overview of all freelancers, their price (day), days worked and total earnings
11. Provide an overview of all worklogs (freelancer, date, year, month, hours spent and project)
12. Provide an overview of all worklogs from April 2017  (freelancer, date, year, month, hours spent and project)
13. Provide an overview of all days spent per month
14. Provide an overview of al zipcodes of: freelancers with a hourly rate higher than 50 and zipcodes of projects with an "u" in their name
15. Provide an overview of states for which we have both freelancers and customers
16. Provide an overview of all days spent, per freelancer per project





