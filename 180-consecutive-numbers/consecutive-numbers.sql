# Aman
select distinct num as consecutivenums
from(select *, lag(num,1) over(order by id) as prev,
lag(num,2) over(order by id) as prev_to_prev
from logs) as a
where num = prev and num = prev_to_prev;
