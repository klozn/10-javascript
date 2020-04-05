**Exercises**

---
**NOTE**

When you bump into `ERROR:  operator does not exist: money = integer`

Cast the field from MONEY to INTEGER with `column_name::numeric` or `CAST(column_name as numeric)`

Or, put the numeric value in single quotes`1000 vs '1000'`.

---

1. Display all ID's, job titles and maximum salary of jobs with a maximum salary fixed to 5500
2. Display all ID's, job titles and minimum salary of jobs with a minimum salary different from 4000
3. Display all ID's, job titles and minimum salary of jobs with a salary between 2000 and 3000
4. Display all ID's, job titles, minimum salary and maximum salary of jobs with a minimum salary greater than 5000 and maximum salary less than 10000 
5. Display all ID's, job titles, minimum salary and maximum salary and the difference between maximum salary and minimum salary
6. Display all ID's, job titles, minimum salary and maximum salary and the difference between maximum salary and minimum salary ordered by the biggest difference on top
7. Display all ID's, job titles, minimum salary and maximum salary and the difference for all jobs where the difference is 3000
8. Display all jobs titles, minimum salary and maximum salary and the difference in percentage (e.g. min=100, max=200, percentage(%)=200).
9. Display all jobs titles, minimum salary and maximum salary and the difference in percentage (e.g. min=100, max=200, percentage(%)=200) for all jobs where the difference is 200%.
10. Display all employees with a salary greater than or equal to 7000 with a commission of 15%. Ordered by their salary.
11. Display all employees without a commission.
12. Display all employees with a commission.
13. Display all employees with a commission and who report to the President Steven King.
14. Display all employees for which the last name starts with a C
15.  Display all employees for which the last name has a 'C' as the third character.
16.  Display all employees for which the last name has a 'c' as the third character.
17.  Display all employees for which the last name has a 'c','C' (either lower or uppercase) as the third character.
18. Display all jobs that contain sales in their job title
19. Display all jobs that contain representative in their job title and a maximum salary in the range of 9000 and 11000.
20. Display all employees who are the the manager of another employee