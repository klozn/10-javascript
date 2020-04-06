Insert, Update, Delete
======================

-- 1. change the last name of Kevin Feeney to Feney

update employees
set last_name = 'Feney'
where employee_id=197;

-- 2. transfer all employees from the Shipping department to the Manufacturing department (and verify your result)

update employees
set department_id = 170
where department_id = 50;

-- 3. assign 'Matthew Weiss' as the new manager and 'Stock Clerk' as the new job for those working in the Manufacturing department having the role of a Shippin Clerk

update employees
set manager_id=120, job_id= 'ST_CLERK'
where department_id=170 and JOB_ID='SH_CLERK';


select *
from employees
where department_id=170 and JOB_ID='SH_CLERK';

-- 4. give every employee a raise in salary of 10%

update employees
set salary=(salary*1.1)

-- 5. remove the current President from the table of employees

delete from employees 
where job_id='AD_PRES'


-- 6. add yourself to the table of employees  as the President

INSERT INTO employees (employee_id, first_name, last_name, email, phone_number, hire_date, Job_id, salary, department_id) VALUES
        ( 207
        , 'John'
        , 'Doe'
        , 'JDOE'
        , '650.121.2019'
        , '12-FEB-1998'
        , 'AD_PRES'
        , 4000
        , 90
        );

-- 7. update the employees currently reporting to the old President to report to you

select *
from jobs where job_id='AD_PRES';

update employees 
set manager_id= 207
where manager_id=100;

-- 8. now try to remove the current President from the table of employees

delete from 
employees where employee_id=100;