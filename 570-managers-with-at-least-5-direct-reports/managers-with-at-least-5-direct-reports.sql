select e.name as name
from employee as e
where (select 
count(*)
from employee as r
where r.managerid = e.id)>=5;
