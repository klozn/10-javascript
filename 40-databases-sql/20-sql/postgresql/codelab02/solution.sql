set schema 'hr';
--1
select job_id, job_title, max_salary
from jobs
where max_salary::numeric = 5500;
--2
select job_id, job_title, min_salary
from jobs
where min_salary <> '4000';
--3
select job_id, job_title, min_salary
from jobs
where min_salary >= '2000'
  and min_salary <= '3000';
--4
select job_id, job_title, min_salary, max_salary
from jobs
where min_salary > '5000'
  and max_salary < '10000';
--5
select job_id, job_title, min_salary, max_salary, max_salary - jobs.min_salary as salary_difference
from jobs;
--6
select job_id, job_title, min_salary, max_salary, max_salary - jobs.min_salary as salary_diff
from jobs
order by salary_diff desc;
--7
select job_id, job_title, min_salary, max_salary, max_salary - jobs.min_salary as salary_diff
from jobs
where (max_salary - jobs.min_salary) = '3000';
--8
select job_title, min_salary, max_salary, (max_salary / min_salary) * 100 as salary_diff_perc
from jobs;
--9
select job_title,
       min_salary,
       max_salary,
       100 * (max_salary / jobs.min_salary) as salary_diff_perc
from jobs
where (max_salary / jobs.min_salary) = 2;
--10
select * from employees
where salary >= '7000' and commission_pct = 0.15
order by salary;
--11
select * from employees
where commission_pct IS NULL;
--12/13
select * from employees
where commission_pct IS NOT NULL and manager_id = 100;
--14
select * from employees
where employees.last_name like 'C%';
--15
select * from employees
where employees.last_name like '__C%';
--17
select * from employees
where employees.last_name like '__c%'
   or employees.last_name like '__C%';
--18
select * from jobs
where lower(job_title) like '%sales%';
--19
select * from jobs
where lower(job_title) like '%representative%'
  and (max_salary::numeric >= 9000 and max_salary::numeric <= 11000);
select *
from employees
where employee_id in (
    select manager_id
    from employees
    );

