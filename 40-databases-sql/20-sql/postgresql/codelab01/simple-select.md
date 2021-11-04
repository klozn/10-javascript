# SQL

---
**NOTE**

To select the correct schema/table, either use:
`SET search_path TO HR;` / `SET SCHEMA 'hr';`

Or specify your table name in full `schema.table`.

---

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
12. For each user table you have access to display all information  (tip: use pgAdmin)
13. Explore all tables (tip: use pgAdmin)  
14. For each location display ID, city, state and country code
15. Display ID, city, state and country code for locations in the United Kingdom
16. Display the department number and department name for departments located in the United Kingdom
17. Display the ID, first name, last name for all employees working for a department in the United Kingdom

![HR tables](../../../10-introduction/oracle/setup-files-oracle/hr-schema-sqlscripts/hrtables.gif)

******************
|  My solution:  |
******************
set schema 'hr';
select department_id, employee_id, first_name, last_name from employees;
select department_id, department_name from departments where department_name = 'Shipping';
select employee_id, first_name, last_name, department_id from employees where department_id = 50 order by last_name, first_name;

select employee_id, first_name, last_name
from employees
where employee_id = (
    select manager_id
    from departments
    where department_id = 50);

select location_id, city, state_province, country_id
from locations
where country_id = 'UK';

select department_id, department_name
from departments
where location_id in (
    select location_id
    from locations
    where country_id = 'UK');

select employee_id, first_name, last_name
from employees
where department_id in (
    select department_id
    from departments
    where location_id in (
        select location_id
        from  locations
        where country_id = 'UK'
)
);
