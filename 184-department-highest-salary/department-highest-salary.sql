# Aman
select department,employee,salary
from (select d.name as department, e.name as employee, e.salary as salary,
dense_rank() over(partition by d.name order by e.salary desc) as rnk
from employee as e
join department as d on e.departmentid = d.id) a
where rnk = 1;
