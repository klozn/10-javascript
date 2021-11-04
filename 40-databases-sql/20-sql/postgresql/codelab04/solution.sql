set schema 'hr';
--1
update employees
set last_name = 'Feney'
where first_name = 'Kevin' and last_name = 'Feeney';
select first_name, last_name
from employees
where last_name like 'F%';
--2
update employees
set department_id = 170
where department_id = 50;

select * from employees;
--3
update employees
set manager_id = 120, job_id = 'ST_CLERK'
where department_id = 170 and job_id = 'SH_CLERK';

select *
from employees
where department_id=170 and JOB_ID='ST_CLERK';
--4
update employees
set salary = salary * 1.1;
--5/8
delete from employees
where employee_id = 100;
--6
insert into employees(employee_id, first_name, last_name, email, phone_number, hire_date,
                      job_id, salary, department_id)
values (
        666,
        'Klaas',
        'Devits',
        'klaas@president.org',
        '+3285945011',
        to_date('2021-11-04', 'YYYY-MM-DD'),
        'AD_PRES',
        '40000',
        10
        );
--7
update employees
set manager_id = 666
where manager_id = 100;


