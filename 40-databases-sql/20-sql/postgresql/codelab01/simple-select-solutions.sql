--**Exercises solution**

--SET search_path TO HR;
-- or
SET SCHEMA 'hr';

--1. For each employee, display all information

select *
from employees;

--2. For each employee, display ID, first name, last name, department number

select employee_id, first_name, last_name, department_id
from employees;

--3. For each employee, display department number, ID, first name, last name in this exact order

select department_id, employee_id, first_name, last_name
from employees;

--4. For each department display all information

select *
from departments;

--5. For each department display department number and department name

select department_id, department_name
from departments;

--6. Display the department number and department name for the 'Shipping' department

select department_id, department_name
from departments
where department_name like 'Shipping';

--7. Display the ID, first name, last name and department number for employees working for the shipping department

select employee_id, first_name, last_name, department_id
from employees
where department_id=50;

--8. Display the ID, first name, last name and department number for employees working for the shipping department ordered by last name (a-z)

select employee_id, first_name, last_name, department_id
from employees
where department_id=50
order by last_name;

--9. Display the ID, first name, last name and department number for employees working for the shipping department ordered by last name (z-a)

select employee_id, first_name, last_name, department_id
from EMPLOYEES
where department_id=50
order by last_name desc;

--10. Display the ID, first name, last name and department number for employees working for the shipping department ordered by first name and last name(a-z)

select employee_id, first_name, last_name, department_id
from EMPLOYEES
where department_id=50
order by first_name, last_name;

--11. Display the ID, first name and last name of the manager of the shipping department

select department_id, department_name, manager_id
from departments
where department_name like 'Shipping';


select employee_id, first_name, last_name
from EMPLOYEES
where employee_id=121;

--12. For each user table you have access to display all information  (tip: user_tables)

--https://www.postgresql.org/docs/12/view-pg-tables.html
select * from pg_tables;
select * from pg_tables where tableowner = 'your-username';
--https://www.postgresql.org/docs/12/information-schema.html
--https://www.postgresql.org/docs/12/infoschema-tables.html
select * from information_schema.tables;
select * from information_schema.tables where table_schema = 'hr';

--13. Explore all tables

--https://www.postgresql.org/docs/12/infoschema-columns.html
SELECT * FROM information_schema.COLUMNS WHERE TABLE_NAME = 'regions';

--14. For each location display ID, city, state and country code

select location_id, city, state_province, country_id
from locations;

--15. Display ID, city, state and country code for locations in the United Kingdom

select country_id, country_name
from countries
where country_name like 'United Kingdom';


select location_id, city, state_province, country_id
from locations
where country_id='UK';

--16. Display the department number and department name for departments located in the United Kingdom

select country_id, country_name
from countries
where country_name like 'United Kingdom';


select location_id, city, state_province, country_id
from locations
where country_id='UK';


select department_id, department_name
from departments
where LOCATION_ID in (2400,2500,2600);

--17. Display the ID, first name, last name for all employees working for a department in the United Kingdom

select country_id, country_name
from countries
where country_name like 'United Kingdom';


select location_id, city, state_province, country_id
from locations
where country_id='UK';


select department_id, department_name
from departments
where LOCATION_ID in (2400,2500,2600);


select employee_id, first_name, last_name
from EMPLOYEES
where department_id in (40,80);
