select id
from (select *, lag(temperature,1) over(order by recorddate) as prev,
lag(recorddate) over(order by recorddate) as prev_date
from weather) as a
where temperature>prev
and datediff(recorddate,prev_date) = 1; 
