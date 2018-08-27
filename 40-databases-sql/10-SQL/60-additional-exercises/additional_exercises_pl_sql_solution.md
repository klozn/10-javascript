*PL/SQL Programs*
- Write a program to interchange the salaries of employee 120 and 122.

```
Declare
   V_salary_120   employees.salary%type;
Begin
  Select  salary into v_salary_120
  From employees where  employee_id = 120;

  Update employees set salary  = ( select salary from employees where employee_id = 122)
  Where employee_id = 120;

  Update employees set salary  =  v_salary_120  Where employee_id = 122;

  Commit;
End;
```
- Increase the salary of employee 115 based on the following conditions: If experience is more than 10 years, increase salary by 20% If experience is greater than 5 years, increase salary by 10% Otherwise 5% Case by Expression:

```
declare
    v_exp  number(2);
    v_hike number(5,2);
begin
    select  floor((sysdate-hire_date) / 365 ) into v_exp
    from employees
    where employee_id = 115;
    
    v_hike := 1.05;
    
    case 
      when  v_exp > 10 then
            v_hike := 1.20;
      when  v_exp > 5  then
            v_hike := 1.10;
    end case;
    
    update employees set salary = salary * v_hike 
    where employee_id = 115;
end;    
```

- Change commission percentage as follows for employee with ID = 150. If salary is more than 10000 then commission is 0.4%, if Salary is less than 10000 but experience is more than 10 years then 0.35%, if salary is less than 3000 then commission is 0.25%. In the remaining cases commission is 0.15%.

```
declare
    v_salary  employees.salary%type;
    v_exp     number(2);
    v_cp      number(5,2);
begin
    select  v_salary,  floor ( (sysdate-hire_date)/365) into v_salary, v_exp
    from  employees
    where employee_id = 150;
    
    if v_salary > 10000 then
           v_cp := 0.4;
    elsif  v_exp > 10 then
           v_cp := 0.35;
    elsif  v_salary < 3000 then
           v_cp := 0.25;
    else
           v_cp := 0.15;
           
    end if;
    
    update employees set commission_pct = v_cp
    where employee_id = 150;
end;
```

- Find out the name of the employee and name of the department for the employee who is managing for employee 103.

```
declare
    v_name     employees.first_name%type;
    v_deptname departments.department_name%type;
begin
    select  first_name , department_name into v_name, v_deptname
    from  employees join departments using (department_id)
    where employee_id = ( select manager_id from employees    where employee_id = 103);
    
    dbms_output.put_line(v_name);
    dbms_output.put_line(v_deptname);
    
end;
```

- Display missing employee IDs.

```
declare
     v_min  number(3);
     v_max  number(3);
     v_c    number(1);
begin
     select min(employee_id), max(employee_id) into v_min, v_max
     from employees;


     for i in  v_min + 1 .. v_max - 1
     loop
           select count(*) into v_c
           from employees 
           where employee_id = i;
           
           if  v_c = 0 then
                dbms_output.put_line(i);
           end if;
    end loop;
     
end;
```

- Display the year in which maximum number of employees joined along with how many joined in each month in that year.

```
declare

      v_year  number(4);
      v_c     number(2);
begin
      select  to_char(hire_date,'yyyy') into v_year
      from  employees
      group by to_char(hire_date,'yyyy')
      having count(*) = 
             ( select  max( count(*))
               from  employees
               group by to_char(hire_date,'yyyy'));
               
      dbms_output.put_line('Year : ' || v_year);

      for month in 1 .. 12
      loop
          select  count(*) into v_c
          from employees
          where  to_char(hire_date,'mm') = month and to_char(hire_date,'yyyy') = v_year;
          
          dbms_output.put_line('Month : ' || to_char(month) || ' Employees : ' || to_char(v_c));

     end loop;          

end;
```

- Change salary of employee 130 to the salary of the employee with first name ‘Joe’. If Joe is not found then take average salary of all employees. If more than one employee with first name ‘Joe’ is found then take the least salary of the employees with first name Joe.

```
declare
    v_salary  employees.salary%type;
begin
     select salary into v_salary
     from employees where first_name = 'Joe';
     
     update employees set salary = v_salary
     where employee_id = 130;
	 
exception
     when no_data_found then
       update employees set salary = (select avg(salary) from employees)
     where employee_id = 130;
end;
```

- Display Job Title and Name of the Employee who joined the job first day.

```
declare
       cursor  jobscur is select  job_id, job_title from jobs;
	   v_name  employees.first_name%type;
begin
       for jobrec in jobscur
	   loop
	         select first_name into v_name
             from employees
             where hire_date = ( select min(hire_date) from employees where job_id = jobrec.job_id)
			 and  job_id = jobrec.job_id;
             			 
             dbms_output.put_line( jobrec.job_title || '-' || v_name); 						  
	   end loop;
end;
```

- Display 5th and 10th employees in Employees table.

```
declare

     cursor empcur is
        select employee_id, first_name 
        from employees;
        
begin
     for emprec  in empcur
     loop
         if empcur%rowcount > 4 then
              dbms_output.put_line( emprec.first_name);
              exit  when   empcur%rowcount > 10;
         end if;
     end loop;
     
end;
```

- Update salary of an employee based on department and commission percentage. If department is 40 increase salary by 10%. If department is 70 then 15%, if commission is more than .3% then 5% otherwise 10%.

```
declare
    cursor empcur is
     select employee_id, department_id, commission_pct
     from employees;
	 
    v_hike  number(2);
begin

    for emprec in empcur
    loop
         if  emprec.department_id = 40 then
              v_hike := 10;
         elsif emprec.department_id = 70 then
              v_hike := 15;
         elsif emprec.commission_pct  > 0.30 then
              v_hike := 5;
         else
              v_hike := 10;
         end if;

         update employees set salary = salary + salary * v_hike/100 
         where employee_id = emprec.employee_id;
         
    end loop;
end;
```

- Create a function that takes department ID and returns the name of the manager of the department.

```
create or replace function get_dept_manager_name(deptid number)
return varchar is

   v_name  employees.first_name%type;
begin
   select first_name into v_name
   from employees
   where  employee_id = ( select manager_id from departments where department_id = deptid);

   return v_name;
end;
```

- Create a function that takes employee ID and return the number of jobs done by the employee in the past.

```
create or replace function get_no_of_jobs_done(empid number)
return number is
   v_count  number(2);
begin
   select count(*) into v_count
   from job_history
   where  employee_id = empid;

   return v_count;
end;
```

- Create a procedure that takes department ID and changes the manager ID for the department to the employee in the department with highest salary. (Use Exceptions).

```
create or replace procedure change_dept_manager(deptid number)
is
   v_empid  employees.employee_id%type;
begin
   select employee_id  into v_empid
   from employees
   where  salary = ( select max(salary) from employees where department_id = deptid)
     and department_id = deptid;

   update departments set manager_id = v_empid
   where  department_id = deptid;
end;
```

- Create a function that takes a manager ID and return the names of employees who report to this manager. The names must be returned as a string with comma separating names.

```
create or replace function get_employees_for_manager(manager number)
return varchar2
is
   v_employees varchar2(1000) := '';
   cursor empcur is
      select  first_name from employees 
      where   manager_id = manager;
begin

     for emprec in empcur
     loop
         v_employees :=  v_employees ||  ',' || emprec.first_name;
     end loop;
     -- remove extra  , at the beginning
     return  ltrim(v_employees,',');
end;
```

- Ensure no changes can be made to HR.EMPLOYEES table before 6am and after 10pm in a day.

```
create or replace trigger  trg_employees_time_check
before update or insert or delete
on employees
for each row
begin
   if  to_char(sysdate,'hh24') < 6 or to_char(sysdate,'hh24') > 10 then
         raise_application_error(-20111,'Sorry! No change can be made before 6 AM and after 10 PM');
   end if;
end;
```

- Create a Trigger to ensure the salary of the employee is not decreased.

```
create or replace trigger  trg_employees_salary_check
before update
on employees
for each row
begin
   if  :old.salary > :new.salary then
         raise_application_error(-20111,'Sorry! Salary can not be decreased!');
   end if;
end;
```

- Create a trigger to ensure the employee and manager belongs to the same department.

Note:  This trigger need to read the row that is being modified, which causes mutating problem.  The solution to mutating problem is
explained at : Work around for mutating problem in Oracle Triggers. Please check it out.
Whenever the job is changed for an employee write the following details into job history. Employee ID, old job ID, old department ID, hire date of the employee for start date, system date for end date. But if a row is already present for employee job history then the start date should be the end date of that row +1.

```
create or replace trigger trg_log_job_change
after update of job_id
on employees
for each row
declare
    v_enddate   date;
    v_startdate date;
begin
   -- find out whether the employee has any row in job_history table
   select max(end_date) into v_enddate
   from job_history
   where employee_id = :old.employee_id;

   if v_enddate is null then
      v_startdate := :old.hire_date;
   else
      v_startdate := v_enddate + 1;
   end if;

   insert into  job_history values (:old.employee_id, v_startdate, sysdate, :old.job_id, :old.department_id);
end;
```

Note: Before testing the above trigger, you need to disable UPDATE_JOB_HISTORY trigger, which is already present in HR account, as it does the same. 
