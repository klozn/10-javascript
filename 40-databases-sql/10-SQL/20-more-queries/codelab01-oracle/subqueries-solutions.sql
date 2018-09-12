-- 1. 
SELECT
  first_name,
  salary
FROM hr.employees
WHERE salary > (SELECT salary
                FROM hr.employees
                WHERE employee_id = 103);
-- 2.
SELECT
  department_id,
  department_name
FROM hr.departments
WHERE location_id = (SELECT location_id
                     FROM hr.departments
                     WHERE department_id = 90);
-- 3. 
SELECT
  last_name,
  hire_date
FROM hr.employees
WHERE hire_date > (SELECT hire_date
                   FROM hr.employees
                   WHERE employee_id = 101);
-- 4.  
SELECT
  first_name,
  last_name,
  department_id
FROM hr.employees
WHERE department_id = (SELECT department_id
                       FROM hr.departments
                       WHERE department_name = 'Sales');
-- 5.  
SELECT
  department_id,
  department_name
FROM hr.departments
WHERE location_id = (SELECT location_id
                     FROM hr.locations
                     WHERE city = 'Toronto');
-- 6.  
SELECT
  first_name,
  last_name,
  salary,
  department_id
FROM hr.employees
WHERE department_id = (SELECT department_id
                       FROM hr.employees
                       WHERE employee_id = 124)
      AND employee_id <> 124;
-- 7. 
SELECT
  first_name,
  last_name,
  salary,
  department_id
FROM hr.employees
WHERE salary > (SELECT AVG(salary)
                FROM hr.employees);
-- 8.  
SELECT
  first_name,
  last_name,
  salary,
  department_id
FROM hr.employees
WHERE salary IN (SELECT salary
                 FROM hr.employees
                 WHERE department_id = 20);
-- 9.  
SELECT
  first_name,
  last_name,
  salary,
  department_id
FROM hr.employees
WHERE salary > ALL (SELECT salary
                    FROM hr.employees
                    WHERE department_id = 50);
-- 10.  
SELECT
  first_name,
  last_name,
  salary,
  department_id
FROM hr.employees
WHERE salary > ANY (SELECT salary
                    FROM hr.employees
                    WHERE department_id = 60);
-- 11. 
SELECT
  first_name,
  last_name,
  salary,
  department_id
FROM hr.employees
WHERE salary < ALL (SELECT salary
                    FROM hr.employees
                    WHERE department_id = 90);
-- 12.
SELECT
  first_name,
  last_name,
  salary,
  department_id
FROM hr.employees
WHERE department_id IN (SELECT department_id
                        FROM hr.departments
                        WHERE location_id = (SELECT location_id
                                             FROM hr.locations
                                             WHERE city = 'Seattle'));
-- 13. 
SELECT
  first_name,
  last_name,
  salary,
  department_id
FROM hr.employees
WHERE salary < (SELECT AVG(salary)
                FROM hr.employees)
      AND department_id IN (SELECT department_id
                            FROM hr.employees
                            WHERE first_name = 'Kevin');



