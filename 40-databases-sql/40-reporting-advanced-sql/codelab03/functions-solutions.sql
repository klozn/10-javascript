-- 1. LOWER / UPPER

SELECT
  LOWER(first_name),
  UPPER(last_name)
FROM employees
WHERE employee_id BETWEEN 80 AND 150;

-- 2. LOWER / UPPER

SELECT
  first_name,
  last_name
FROM employees
WHERE UPPER(last_name) = 'KING';

-- OR

SELECT
  first_name,
  last_name
FROM employees
WHERE LOWER(last_name) = 'king';

-- 3. CONCAT

SELECT CONCAT(first_name, last_name)
FROM employees;

-- 4.

SELECT CONCAT(first_name, CONCAT(last_name, hire_date))
FROM employees;

-- 5. SUBSTR / LENGTH
SELECT
  first_name,
  last_name,
  SUBSTR(first_name, 1, 1) || SUBSTR(last_name, 1, 3) || '@oracle.com'
FROM employees;

-- 6.
SELECT
  first_name,
  last_name,
  SUBSTR(first_name, 1, 1) || SUBSTR(last_name, LENGTH(last_name) - 2, 3) || '@oracle.com'
FROM employees;

-- 7. LENGTH

SELECT last_name
FROM employees
WHERE LENGTH(last_name) > 8;

-- 8. REPLACE
SELECT
  first_name,
  last_name,
  REPLACE(phone_number, '515', '815')
FROM employees;

-- 10. ROUND / TRUNC

SELECT
  first_name,
  salary,
  salary * 1.1234,
  ROUND(salary * 1.1234, 0),
  floor(salary * 1.1234)
FROM employees;

-- 11. ADD_MONTHS

SELECT
  first_name,
  hire_date,
  hire_date + 10,
  add_months(hire_date, 1),
  floor(sysdate - hire_date)
FROM employees;

-- 12. MONTHS YEARS BETWEEN

SELECT
  first_name,
  last_name,
  hire_Date,
  months_between(sysdate, hire_date),
  floor(months_between(sysdate, hire_date)/12)
FROM employees;

-- 13. ADD_MONTHS

SELECT
  first_name,
  hire_date,
  add_months(hire_date, 12)
FROM employees;

-- 14. DATES
SELECT
  first_name,
  hire_date,
  extract(year from hire_date),
  extract(month from hire_date)
FROM employees;

-- 15. DATES
SELECT
  first_name,
  hire_date,
  extract(day from hire_date),
  extract(year from hire_date)
FROM employees;

-- 16. FORMATTING
SELECT
  UPPER(last_name),
  to_char( salary, '$99,999.99'),
  to_char(hire_date,'DD/MM/YYYY')
FROM employees
WHERE SUBSTR(last_name, 1, 1) IN ('D', 'K');

-- 17. NVL / TO_CHAR
SELECT
  first_name,
  last_name,
  salary,
  commission_pct,
  nvl(commission_pct, 0)
FROM employees;

-- 18.
SELECT
  first_name,
  last_name,
  salary,
  commission_pct,
  nvl(to_char(commission_pct), 'No commission')
FROM employees;

-- 19. CASE
SELECT
  first_name,
  last_name,
  salary,
  CASE WHEN salary BETWEEN 0 AND 5000
    THEN 'A'
  WHEN salary BETWEEN 5001 AND 15000
    THEN 'B'
  WHEN salary BETWEEN 15001 AND 20000
    THEN 'C'
  ELSE 'D'
  END AS "SAL_RANKS"
FROM employees;