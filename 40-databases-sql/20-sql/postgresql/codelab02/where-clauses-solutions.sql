-- **Exercises**

--1. Display all ID's, job titles and maximum salary of jobs with a maximum salary fixed to 5500
select job_id, job_title, max_salary
from jobs
where max_salary::numeric =5500;
--OR
select job_id, job_title, max_salary
from jobs
where max_salary = '5500';

--2. Display all ID's, job titles and minimum salary of jobs with a minimum salary different from 4000
select job_id, job_title, min_salary
from jobs
where min_salary::numeric <> 4000;
--OR
select job_id, job_title, min_salary
from jobs
where min_salary <> '4000';

--3. Display all ID's, job titles and minimum salary of jobs with a salary between 2000 and 3000
select job_id, job_title, min_salary
from jobs
where min_salary::numeric between 2000 and 3000;
--OR
select job_id, job_title, min_salary
from jobs
where min_salary between '2000' and '3000';

--4. Display all ID's, job titles, minimum salary and maximum salary of jobs with a minimum salary greater than 5000 and maximum salary less than 1000

select job_id, job_title, min_salary, max_salary
from jobs
where min_salary::numeric > 5000 and max_salary::numeric < 10000;
--OR
select job_id, job_title, min_salary, max_salary
from jobs
where min_salary > '5000' and max_salary < '10000';

--5. Display all ID's, job titles, minimum salary and maximum salary and the difference between maximum salary and minimum salary

select job_id, job_title, min_salary, max_salary, max_salary-min_salary as "difference"
from jobs;

--6. Display all ID's, job titles, minimum salary and maximum salary and the difference between maximum salary and minimum salary

select job_id, job_title, min_salary, max_salary, max_salary-min_salary as "difference"
from jobs
order by max_salary-min_salary desc;

--7. Display all ID's, job titles, minimum salary and maximum salary and the difference for all jobs where the difference is 3000

select job_id, job_title, min_salary, max_salary, max_salary-min_salary as "difference"
from jobs
where (max_salary-min_salary)::numeric = 3000;
--OR
select job_id, job_title, min_salary, max_salary, max_salary-min_salary as "difference"
from jobs
where max_salary-min_salary = '3000';

--8. Display all jobs titles, minimum salary and maximum salary and the difference in percentage (e.g. min=100, max=200, percentage(%)=200) for all jobs.

select job_id, job_title, min_salary, max_salary, (max_salary/min_salary)*100 as "difference (%)"
from jobs;

--9. Display all jobs titles, minimum salary and maximum salary and the difference in percentage (e.g. min=100, max=200, percentage(%)=200) for all jobs where the difference is 200%.

select job_id, job_title, min_salary, max_salary, (max_salary/min_salary)*100 as "difference (%)"
from jobs
where (max_salary/min_salary)=2;

--10. Display all employees with a salary greater than or equal to 7000 with a commission of 15%. Ordered by their salary.

select *
from employees
where salary::numeric >= 7000 and commission_pct =0.15
order by salary asc;
--OR
select *
from employees
where salary >= '7000' and commission_pct =0.15
order by salary asc;

--11. Display all employees without a commission.

select *
from employees
where commission_pct is null;

--12. Display all employees with a commission.

select *
from employees
where commission_pct is not null;

--13. Display all employees with a commission and who report to the President Steven King.

select *
from employees
where commission_pct is not null
      and manager_id=100;

--14. Display all employees for which the last name starts with a C

select *
from employees
where last_name like 'C%';

--15.  Display all employees for which the last name has a 'C' as the third character.

select *
from employees
where last_name like '__C%';

--16.  Display all employees for which the last name has a 'c' as the third character.

select *
from employees
where last_name like '__c%';

--17.  Display all employees for which the last name has a 'c','C' (either lower or uppercase) as the third character.

select *
from employees
where last_name like '__c%'
      OR last_name like '__C%';

select *
from employees
where lower(last_name) like '__c%';

--18. Display all jobs that contain sales in their job title

select *
from jobs
where lower(job_title) like '%sales%';

--19. Display all jobs that contain representative in their job title and a maximum salary in the range of 9000 and 11000.

select *
from jobs
where lower(job_title) like '%representative%'
      and max_salary::numeric between 9000 and 11000;
--OR
select *
from jobs
where lower(job_title) like '%representative%'
      and max_salary between '9000' and '11000';

--20. Display all employees who are the the manager of another employee

select *
from employees where employee_id in (
  select distinct manager_id
  from employees);