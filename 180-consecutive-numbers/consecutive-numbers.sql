select distinct num as ConsecutiveNums
from (select *,lag(num,1) over() as prev,
lag(num,2) over() as prev_to_prev
from logs) as a
where num=prev and num =prev_to_prev;
