CREATE SCHEMA IF NOT EXISTS hr;
--SET search_path TO HR;

CREATE TABLE IF NOT EXISTS hr.regions (
    -- column_name  TYPE        column_constraint,
    region_id       INTEGER     PRIMARY KEY,
    --region_id       SERIAL     PRIMARY KEY,
    region_name     VARCHAR(25)
);

CREATE TABLE IF NOT EXISTS hr.countries (
    country_id      CHAR(2)     PRIMARY KEY,
    country_name    VARCHAR(40),
    region_id       INTEGER,
    FOREIGN KEY (region_id) REFERENCES hr.regions(region_id)
);

CREATE TABLE IF NOT EXISTS hr.locations(
    location_id     INTEGER     PRIMARY KEY,
    --location_id     SERIAL    PRIMARY KEY,
    street_address  VARCHAR(40),
    postal_code     VARCHAR(12),
    city            VARCHAR(30)  NOT NULL,
    state_province  VARCHAR(25),
    country_id      CHAR(2),
    FOREIGN KEY (country_id) REFERENCES hr.countries(country_id)
);

CREATE TABLE IF NOT EXISTS hr.departments(
    department_id    INTEGER     PRIMARY KEY,
    --department_id    SERIAL     PRIMARY KEY,
    department_name  VARCHAR(30) NOT NULL,
    manager_id       INTEGER,
    location_id      INTEGER,
    FOREIGN KEY (location_id) REFERENCES hr.locations (location_id)
);

CREATE TABLE IF NOT EXISTS hr.jobs(
    job_id         VARCHAR(10)   PRIMARY KEY ,
    job_title      VARCHAR(35)   NOT NULL,
    min_salary     MONEY, --https://www.postgresql.org/docs/12/datatype-money.html
    max_salary     MONEY
);

CREATE TABLE IF NOT EXISTS hr.employees(
    employee_id    INTEGER PRIMARY KEY,
    first_name     VARCHAR(20),
    last_name      VARCHAR(25) NOT NULL,
    email          VARCHAR(25) NOT NULL UNIQUE ,
    phone_number   VARCHAR(20),
    hire_date      DATE NOT NULL,
    job_id         VARCHAR(10)  NOT NULL,
	--salary         INTEGER CHECK (salary > 0), -- https://www.postgresql.org/docs/12/ddl-constraints.html
    salary         MONEY CHECK (salary > 0::MONEY), -- https://www.postgresql.org/docs/12/ddl-constraints.html
	--salary         MONEY CHECK (salary::INTEGER > 0), -- https://www.postgresql.org/docs/12/ddl-constraints.html
    commission_pct DECIMAL(2,2),
    manager_id     INTEGER ,
    department_id  INTEGER,
    FOREIGN KEY (department_id) REFERENCES hr.departments(department_id),
    FOREIGN KEY (job_id) REFERENCES hr.jobs (job_id),
    FOREIGN KEY (manager_id) REFERENCES hr.employees(employee_id)
) ;

--ALTER TABLE HR..departments ADD CONSTRAINT dept_mgr_fk FOREIGN KEY (manager_id) REFERENCES employees (employee_id);

CREATE TABLE IF NOT EXISTS hr.job_history(
    employee_id   INTEGER NOT NULL,
    start_date    DATE NOT NULL,
    end_date      DATE NOT NULL CHECK (end_date > start_date),
    job_id        VARCHAR(10) NOT NULL,
    department_id INTEGER,
    PRIMARY KEY (employee_id, start_date),
    FOREIGN KEY (job_id) REFERENCES hr.jobs(job_id),
    FOREIGN KEY (employee_id) REFERENCES hr.employees(employee_id),
    FOREIGN KEY (department_id) REFERENCES hr.departments(department_id)
) ;