select e.name as name
from employee as e
join employee as r on r.managerid = e.id
group by e.id
having count(r.managerid)>=5;
