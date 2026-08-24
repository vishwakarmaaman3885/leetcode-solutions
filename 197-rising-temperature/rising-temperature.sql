-- Aman
select w1.id
from weather as w1
join weather as w2 on  datediff(w1.recorddate,w2.recorddate) = 1 
where w1.temperature>w2.temperature;
