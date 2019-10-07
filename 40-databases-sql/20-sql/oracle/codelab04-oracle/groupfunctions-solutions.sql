-- 1.

SELECT MIN(last_name)
FROM employees;

-- 2.

SELECT MAX(last_name)
FROM employees;

-- 3.

SELECT COUNT(*) FROM employees;

-- 4.

SELECT COUNT(commission_pct) FROM employees;

-- 5.

SELECT COUNT(*) - COUNT(commission_pct) FROM employees;

-- 6.

SELECT MIN(salary) , MAX(salary) , AVG(salary)
FROM employees;

-- 7.

SELECT department_id , AVG(salary)
FROM employees 
GROUP BY department_id;

-- 8.

SELECT department_id , AVG(salary)
FROM employees 
WHERE department_id IN (50, 80)
GROUP BY department_id;

-- 9.

SELECT job_id , COUNT(*)
FROM employees 
GROUP BY job_id;

-- 10.

SELECT job_id , COUNT(*)
FROM employees 
WHERE salary > 10000
GROUP BY job_id;

-- 11.

SELECT job_id , COUNT(*)
FROM employees 
WHERE salary > 10000
GROUP BY job_id 
HAVING count(*) > 2;

-- 12.

SELECT AVG(salary) , department_id , job_id 
FROM employees 
GROUP BY department_id , job_id;

-- 13.

SELECT MAX(salary) , manager_id
FROM employees
GROUP BY manager_id;

-- 14.

SELECT MAX(salary) , manager_id 
FROM employees 
GROUP BY manager_id 
HAVING MAX(salary) > 10000;

-- 15.

SELECT MIN(salary) , job_id 
FROM employees 
GROUP BY job_id
HAVING MIN(salary) > 7000;

-- 16.

SELECT AVG(salary) , department_id 
FROM employees 
WHERE department_id BETWEEN 20 AND 80 
GROUP BY department_id 
HAVING AVG(salary) > 9000;

select *
from
  (select *
   FROM employees
   order by hire_date desc)
where rownum < 4;