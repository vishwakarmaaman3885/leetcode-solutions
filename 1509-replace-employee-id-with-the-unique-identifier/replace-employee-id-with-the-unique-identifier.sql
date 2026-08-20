### Aman

with cte as
(select e.unique_id, em.name
from employees as em
left join employeeuni as e on em.id = e.id)
select unique_id,name
from cte
