set schema 'hr';
--1
select e.first_name,
       e.last_name,
       d.department_name
from employees e
         left join departments d
                   on e.department_id = d.department_id;
--2
select e.first_name,
       e.last_name,
       e.department_id,
       d.department_name
from employees e
         join departments d
              on d.department_id = e.department_id
where e.department_id in (50, 90);
--3
select dep.department_name, loc.city, loc.state_province
from departments dep
         join locations loc
                   on dep.location_id = loc.location_id;
--4
select concat(emp.last_name, ' ', emp.first_name) as full_name,
       dep.department_name,
       loc.city,
       loc.state_province
from employees emp
         left join departments dep
                   on emp.department_id = dep.department_id
         left join locations loc
                   on dep.location_id = loc.location_id
order by emp.last_name, emp.first_name;
--5
select concat(emp.last_name, ' ', emp.first_name) as full_name,
       dep.department_name,
       loc.city,
       loc.state_province
from employees emp
         join departments dep
                   on emp.department_id = dep.department_id
         join locations loc
                   on dep.location_id = loc.location_id
where lower(last_name) like '%a%'
order by emp.last_name, emp.first_name;
--6
select first_name, salary, job_title
from employees e
         join jobs j
              on e.job_id = j.job_id;
--7/8
select first_name, last_name, e.department_id, department_name
from employees e
         full outer join departments d on e.department_id = d.department_id;
--9/10
select emp.last_name as employee, man.last_name as manager
from employees emp
        left join employees man on emp.manager_id = man.employee_id;
--11
select e.first_name, e.last_name, e.department_id
from employees e
join employees m on m.department_id = e.department_id
    and m.last_name = 'King'
and e.last_name <> 'King';
--12
select e.last_name, e.salary
from employees e
join employees o
    on o.salary > e.salary
           and o.employee_id = 103;

