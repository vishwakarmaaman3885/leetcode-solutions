with ranked_employees as(select d.name as department, e.name as employee, e.salary as salary,
dense_rank() over(partition by d.id order by salary desc) as rnk
from employee as e
join department as d on e.departmentid = d.id) 
select  Department, Employee, Salary
from ranked_employees
where rnk<=3;
