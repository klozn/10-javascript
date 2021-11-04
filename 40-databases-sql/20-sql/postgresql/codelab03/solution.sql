set schema 'hr';

--1
select first_name, department_id
from employees
where last_name = 'De Haan';
--2
select *
from departments
where department_name = 'Sales';
--3
select first_name, last_name, department_id, salary
from employees
where salary::numeric > 9700;
--4
select *
from employees
where hire_date < '2003-01-01';
--5
select employee_id, first_name, job_id, department_id
from employees
where department_id in (20, 60, 80);
--6
select employee_id, first_name, job_id, department_id
from employees
where department_id not in (20, 60, 80);
--7
select last_name, phone_number, salary, manager_id
from employees
where manager_id in (100, 102, 103);
--8
select first_name, salary
from employees
where first_name like '%e';
--9
select last_name, department_id
from employees
where last_name like '_i%';
--10
select *
from employees
where lower(last_name) like '%l%'
   or lower(last_name) like '%j%'
   or lower(last_name) like '%h%'
order by salary desc;
--11
select first_name, hire_date, salary, department_id
from employees
where lower(first_name) not like '%a%'
order by department_id;
--12
select *
from employees
where department_id is null;
--13
select concat(first_name, ',', last_name) as name, salary
from employees
where salary::numeric not between 7000 and 15000
order by name;
--14
select concat(first_name, ',', last_name) as FULL_NAME,
       concat(phone_number, '-', email) as CONTACTS,
       salary as SAL
from employees
where salary::numeric between 5000 and 10000;
--15
select *
from employees
where ((salary::numeric between 800 and 6000) and commission_pct is not null)
   or ((department_id not in (80, 90, 100)) and hire_date < '1990-01-01');
--16
select last_name, job_id, hire_date
from employees
where hire_date between '1995-12-12' and '2002-04-17';
--17
select concat(first_name, last_name) as full_name,
       hire_date, commission_pct, phone_number, salary
from employees
where salary::numeric > 10000
   or phone_number like '__5%'
order by first_name desc;
--18
select last_name, salary
from employees
where salary::numeric > 12000;
--19
select last_name, department_id
from employees
where department_id in (50, 80);
select last_name, department_id
from employees
where department_id = 50 or department_id = 80;
--20
select first_name, salary
from employees
where commission_pct is null;
--21
select first_name, salary, manager_id
from employees
where manager_id is not null;