#Aman
select employee_id
from employees
where employee_id not in (select e.employee_id as employee_id
from employees as e
join salaries as s on e.employee_id = s.employee_id)
union
select employee_id
from salaries
where employee_id not in (select e.employee_id as employee_id
from employees as e
join salaries as s on e.employee_id = s.employee_id)
order by employee_id asc;
