-- 1. Provide an overview of all freelancers and their hourly price, daily price (8hours) and their address info (including state, zip, ...) ordered by price

SELECT 
       FREELANCERS.FREELANCER_ID , 
       FREELANCERS.NAME , 
       FREELANCERS.PRICE , 
       FREELANCERS.PRICE * 8 AS "Price per day" , 
       FREELANCERS.ADDRESS , 
       FREELANCERS.ZIPCODE , 
       ZIPCODES.CITY , 
       ZIPCODES.COUNTY , 
       ZIPCODES.STATE
FROM 
     APP.FREELANCERS
     JOIN APP.ZIPCODES ON FREELANCERS.ZIPCODE = ZIPCODES.ZIPCODE
ORDER BY 
         price DESC;

-- 2. Provide an overview of all projects (ID, Name) and their customers (including address info)

SELECT 
       PROJECTS.PROJECT_ID , 
       PROJECTS.PROJECT_NAME , 
       CUSTOMERS.CUSTOMER_NAME , 
       CUSTOMERS.ADDRESS , 
       CUSTOMERS.ZIPCODE , 
       ZIPCODES.CITY , 
       ZIPCODES.COUNTY , 
       ZIPCODES.STATE
FROM 
     APP.PROJECTS
     JOIN APP.CUSTOMERS ON PROJECTS.CUSTOMER_ID = CUSTOMERS.CUSTOMER_ID
     JOIN APP.ZIPCODES ON CUSTOMERS.ZIPCODE = ZIPCODES.ZIPCODE;

--  3. Provide an overview of all worklogs (date and hours, days (8h)), including freelancer name and project name

SELECT 
       FREELANCERS.NAME , 
       WORKLOGS.WORKDAY , 
       WORKLOGS.HOURS , 
       WORKLOGS.HOURS / 8 AS "DAYS" , 
       PROJECTS.PROJECT_NAME
FROM 
     APP.WORKLOGS
     JOIN APP.FREELANCERS ON WORKLOGS.FREELANCER_ID = FREELANCERS.FREELANCER_ID
     JOIN APP.PROJECTS ON WORKLOGS.PROJECT_ID = PROJECTS.PROJECT_ID;

--  4. Provide an overview of all projects, their estimation and the amount of days actually spent

SELECT 
       PROJECTS.PROJECT_ID , 
       PROJECTS.PROJECT_NAME , 
       PROJECTS.ESTIMATION , 
       SUM(WORKLOGS.HOURS) / 8 AS "DAYS"
FROM 
     APP.WORKLOGS
     JOIN APP.FREELANCERS ON WORKLOGS.FREELANCER_ID = FREELANCERS.FREELANCER_ID
     JOIN APP.PROJECTS ON WORKLOGS.PROJECT_ID = PROJECTS.PROJECT_ID
GROUP BY 
         PROJECTS.PROJECT_ID , 
         PROJECT_NAME , 
         ESTIMATION;

-- 5. Provide an overview of all projects, their estimation, the amount of days spent and the over/underspent in percentage

SELECT 
       PROJECTS.PROJECT_ID , 
       PROJECTS.PROJECT_NAME , 
       PROJECTS.ESTIMATION , 
       SUM(WORKLOGS.HOURS) / 8 AS                            "DAYS" , 
       ( ( SUM(WORKLOGS.HOURS) / 8 ) / ESTIMATION ) * 100 AS "Over/underspent %"
FROM 
     APP.WORKLOGS
     JOIN APP.FREELANCERS ON WORKLOGS.FREELANCER_ID = FREELANCERS.FREELANCER_ID
     JOIN APP.PROJECTS ON WORKLOGS.PROJECT_ID = PROJECTS.PROJECT_ID
GROUP BY 
         PROJECTS.PROJECT_ID , 
         PROJECT_NAME , 
         ESTIMATION;

-- 6. Provide an overview of all projects, and their actual cost (payed to freelancers)

SELECT 
       PROJECT_NAME , 
       SUM(PRICE * HOURS) AS "Total Cost"
FROM 
     APP.WORKLOGS
     JOIN APP.FREELANCERS ON WORKLOGS.FREELANCER_ID = FREELANCERS.FREELANCER_ID
     JOIN APP.PROJECTS ON WORKLOGS.PROJECT_ID = PROJECTS.PROJECT_ID
GROUP BY 
         PROJECT_NAME;

-- 7. calculate the average freelance price

SELECT 
       AVG(PRICE)
FROM 
     APP.FREELANCERS;

-- 8. Provide an overview of all projects, their estimation, and income based on: estimation * (average hourly freelance price + 10% margin) *8

SELECT 
       PROJECT_ID , 
       PROJECT_NAME , 
       ESTIMATION , 
       ESTIMATION * (
                        SELECT 
                               AVG(PRICE) * 1.1
                        FROM 
                             APP.FREELANCERS
                    ) * 8 AS "Income"
FROM 
     APP.PROJECTS;

-- 9. Provide an overview of all freelancers and their total time spent on all projects in days

SELECT 
       FREELANCERS.FREELANCER_ID , 
       FREELANCERS.NAME , 
       SUM(HOURS) / 8 AS "Total time spent (days)"
FROM 
     APP.WORKLOGS
     JOIN APP.FREELANCERS ON WORKLOGS.FREELANCER_ID = FREELANCERS.FREELANCER_ID
GROUP BY 
         FREELANCERS.FREELANCER_ID , 
         FREELANCERS.NAME;

-- 10. Provide an overview of all freelancers, their price (day), days worked and total earnings

SELECT 
       FREELANCERS.FREELANCER_ID , 
       FREELANCERS.NAME , 
       FREELANCERS.PRICE * 8 AS "Price (day)" , 
       SUM(hours) / 8 AS        "Days worked" , 
       SUM(HOURS * price) AS    "Earnings"
FROM 
     APP.WORKLOGS
     JOIN APP.FREELANCERS ON WORKLOGS.FREELANCER_ID = FREELANCERS.FREELANCER_ID
GROUP BY 
         FREELANCERS.FREELANCER_ID , 
         FREELANCERS.NAME , 
         FREELANCERS.PRICE;

-- 11. Provide an overview of all worklogs (freelancer, date, year, month, hours spent and project)

SELECT 
       FREELANCERS.NAME , 
       WORKLOGS.WORKDAY , 
       DATEPART(year , WORKLOGS.WORKDAY) AS  "YEAR" , 
       DATEPART(month , WORKLOGS.WORKDAY) AS "MONTH" , 
       WORKLOGS.HOURS , 
       PROJECTS.PROJECT_NAME
FROM 
     APP.WORKLOGS
     JOIN APP.FREELANCERS ON WORKLOGS.FREELANCER_ID = FREELANCERS.FREELANCER_ID
     JOIN APP.PROJECTS ON WORKLOGS.PROJECT_ID = PROJECTS.PROJECT_ID;

--12. Provide an overview of all worklogs from April 2017  (freelancer, date, year, month, hours spent and project)

SELECT 
       FREELANCERS.NAME , 
       WORKLOGS.WORKDAY , 
       DATEPART(year , WORKLOGS.WORKDAY) AS  "YEAR" , 
       DATEPART(month , WORKLOGS.WORKDAY) AS "MONTH" , 
       WORKLOGS.HOURS , 
       PROJECTS.PROJECT_NAME
FROM 
     APP.WORKLOGS
     JOIN APP.FREELANCERS ON WORKLOGS.FREELANCER_ID = FREELANCERS.FREELANCER_ID
     JOIN APP.PROJECTS ON WORKLOGS.PROJECT_ID = PROJECTS.PROJECT_ID
WHERE DATEPART(year , WORKLOGS.WORKDAY) = 2017
      AND 
      DATEPART(month , WORKLOGS.WORKDAY) = 4;

--13. Provide an overview of all days spent per month

SELECT 
       DATEPART(year , WORKLOGS.WORKDAY) AS  "YEAR" , 
       DATEPART(month , WORKLOGS.WORKDAY) AS "MONTH" , 
       SUM(hours / 8) AS                     "Days spent"
FROM 
     APP.WORKLOGS
GROUP BY 
         DATEPART(year , WORKLOGS.WORKDAY) , 
         DATEPART(month , WORKLOGS.WORKDAY)
ORDER BY 
         DATEPART(year , WORKLOGS.WORKDAY) , 
         DATEPART(month , WORKLOGS.WORKDAY) ASC;

-- 14. Provide an overview of al zipcodes of: freelancers with a hourly rate higher than 50 and zipcodes of projects with an "u" in their name

SELECT 
       zipcode
FROM 
     APP.FREELANCERS
WHERE price > 50
UNION
SELECT 
       zipcode
FROM 
     app.CUSTOMERS
WHERE LOWER(customer_name) LIKE '%u%';

-- 15. Provide an overview of states for which we have both freelancers and customers

SELECT 
       STATE
FROM 
     APP.FREELANCERS
     JOIN APP.ZIPCODES ON FREELANCERS.ZIPCODE = ZIPCODES.ZIPCODE
INTERSECT
SELECT 
       STATE
FROM 
     APP.CUSTOMERS
     JOIN APP.ZIPCODES ON CUSTOMERS.ZIPCODE = ZIPCODES.ZIPCODE;

SELECT 
       STATE
FROM 
     APP.FREELANCERS
     JOIN APP.ZIPCODES ON FREELANCERS.ZIPCODE = ZIPCODES.ZIPCODE
WHERE STATE IN (
                   SELECT 
                          STATE
                   FROM 
                        APP.CUSTOMERS
                        JOIN APP.ZIPCODES ON CUSTOMERS.ZIPCODE = ZIPCODES.ZIPCODE
               );

-- 16. provide an overview of all days spent, per freelancer per project

SELECT 
       PROJECTS.PROJECT_NAME , 
       FREELANCERS.NAME , 
       SUM(WORKLOGS.HOURS) / 8 AS "Days Spent"
FROM 
     APP.WORKLOGS
     JOIN APP.FREELANCERS ON WORKLOGS.FREELANCER_ID = FREELANCERS.FREELANCER_ID
     JOIN APP.PROJECTS ON WORKLOGS.PROJECT_ID = PROJECTS.PROJECT_ID
GROUP BY 
         FREELANCERS.NAME , 
         PROJECTS.PROJECT_NAME
ORDER BY 
         PROJECT_NAME , 
         NAME;