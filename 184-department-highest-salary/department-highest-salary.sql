# Aman
select d.name as department, e.name as employee, e.salary as salary
from employee as e
join department as d on e.departmentid = d.id
where e.salary in(select max(salary)
from employee as e
where e.departmentid = d.id )

