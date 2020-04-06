-- 1
SELECT first_name , department_id
FROM employees
WHERE last_name = 'De Haan';
-- 2
SELECT *
FROM  departments
WHERE department_name = 'Sales';
-- 3
SELECT first_name , last_name , department_id , salary
FROM employees
WHERE salary::numeric > 9700 ;
--OR
SELECT first_name , last_name , department_id , salary
FROM employees
WHERE salary > '9700' ;
-- 4
SELECT *
FROM employees
WHERE hire_date < to_date('2003-01-01','YYYY-DD-MM');
-- 5
SELECT employee_id , first_name , job_id, department_id
FROM employees
WHERE department_id IN (20 , 60 , 80) ;
-- 6
SELECT employee_id , first_name , job_id, department_id
FROM employees
WHERE department_id NOT IN (20 , 60 , 80) ;
-- 7
SELECT last_name , phone_number , salary , manager_id
FROM employees
WHERE manager_id IN (103 , 102 , 100) ;
-- 8
SELECT first_name , salary
FROM employees
WHERE first_name LIKE '%e';
-- 9
SELECT last_name , department_id
FROM employees
WHERE last_name LIKE '_i%';
-- 10
SELECT *
FROM employees
WHERE last_name LIKE '%L%'
OR    last_name LIKE '%J%'
OR    last_name LIKE '%H%'
ORDER BY salary DESC;
-- 11.
SELECT first_name , hire_date , salary , department_id
FROM employees
WHERE lower(first_name) NOT LIKE '%a%'
ORDER BY department_id;
-- 12
SELECT *
FROM employees
WHERE department_id IS NULL;
-- 13
SELECT first_name||' '||last_name , salary
FROM employees
WHERE salary::numeric NOT BETWEEN 7000 AND 15000
ORDER BY first_name||' '||last_name;
--OR
SELECT first_name||' '||last_name , salary
FROM employees
WHERE salary NOT BETWEEN '7000' AND '15000'
ORDER BY first_name||' '||last_name;
-- 14
SELECT first_name || ' ' || last_name AS "FULL_NAME" ,
       phone_number || ' - ' || email AS "CONTACTS",
       salary  AS "SAL"
FROM employees
WHERE salary::numeric BETWEEN 5000 AND 10000;
-- 15
SELECT *
FROM employees
WHERE salary::numeric BETWEEN 6000 AND 8000 AND commission_pct IS NOT NULL
OR
department_id NOT IN (80 , 90 , 110) AND  hire_date < to_date('01-JAN-1990','DD-MON-YYYY');
-- 16
SELECT last_name , job_id , hire_date 
FROM employees 
WHERE hire_date 
BETWEEN to_date('1995-12-12','YYYY-MM-DD') AND to_date('2002-04-17','YYYY-MM-DD');
-- 17
SELECT first_name||' '||last_name , hire_date , commission_pct , phone_number , salary
FROM employees 
WHERE salary::numeric > 10000
OR
      phone_number LIKE '__5%'
ORDER BY first_name DESC;
-- 18
SELECT last_name , salary
FROM employees
WHERE salary::numeric > 12000;
-- 19
SELECT  last_name, department_id
FROM employees
WHERE department_id = 50 OR department_id = 80;
--
SELECT  last_name, department_id
FROM employees
WHERE department_id IN (50 , 80);
-- 20
SELECT first_name , salary
FROM employees
WHERE commission_pct IS NULL;
-- 21
SELECT first_name , salary , manager_id
FROM employees
WHERE manager_id IS NOT NULL;







