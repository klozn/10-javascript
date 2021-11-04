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