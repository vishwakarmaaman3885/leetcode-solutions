-- Aman
select w1.id
from weather as w1
join weather as w2 
where w1.temperature>w2.temperature and
datediff(w1.recorddate,w2.recorddate) = 1 ;
