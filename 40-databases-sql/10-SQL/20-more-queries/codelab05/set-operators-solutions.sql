-- Set operators
-- ===============

-- 1. Provide a single list of all countries and regions (column name = "Name") and their type (either Country or Region)

SELECT
  COUNTRY_NAME AS "Name",
  'Country'    AS "Type"
FROM HR.COUNTRIES
UNION
SELECT
  REGION_NAME,
  'Region'
FROM HR.REGIONS;

-- 2. Provide a singe list of first_name, last_name, and manager_id of those without manager and those that report to the ones without manager (using set operators)
SELECT
  FIRST_NAME,
  LAST_NAME,
  MANAGER_ID
FROM HR.EMPLOYEES
WHERE MANAGER_ID IS NULL
UNION
SELECT
  FIRST_NAME,
  LAST_NAME,
  MANAGER_ID
FROM EMPLOYEES
WHERE MANAGER_ID = 100;

-- 3. Provide a singe list of first_name, last_name, manager_id, and department_id of those reporting to Stephen King and not working for the Shipping department
SELECT
  first_name,
  last_name,
  manager_id,
  department_id
FROM hr.employees e
WHERE manager_id = 100
MINUS
SELECT
  first_name,
  last_name,
  manager_id,
  department_id
FROM hr.employees e
WHERE department_id = 50;

-- 4. Provide a singe list of first_name, last_name, manager_id, and department_id of those reporting to Stephen King and working for the Shipping department

SELECT
  first_name,
  last_name,
  manager_id,
  department_id
FROM hr.employees e
WHERE manager_id = 100
INTERSECT
SELECT
  first_name,
  last_name,
  manager_id,
  department_id
FROM hr.employees e
WHERE department_id = 50;

-- 5. Provide a report of first_name, last_name, manager_id and level (lvl 0,1,2)
-- President = level 0
-- Those reporting to the President = level 1
-- Those reporting to those reporting to the President = level 2
-- Use two set operators
SELECT *
FROM
  (
    SELECT
      first_name,
      last_name,
      manager_id,
      0 AS lvl
    FROM hr.employees
    WHERE manager_id IS NULL
    UNION
    SELECT
      first_name,
      last_name,
      manager_id,
      1 AS lvl
    FROM hr.employees
    WHERE manager_id IN (SELECT employee_id
                         FROM hr.employees
                         WHERE manager_id IS NULL)
    UNION
    SELECT
      first_name,
      last_name,
      manager_id,
      2 AS lvl
    FROM hr.employees
    WHERE manager_id IN (SELECT employee_id
                         FROM hr.employees
                         WHERE manager_id IN (SELECT employee_id
                                              FROM hr.employees
                                              WHERE manager_id IS NULL)))
ORDER BY lvl ASC;