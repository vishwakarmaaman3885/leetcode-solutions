select player_id, event_date as first_login
from (select *, dense_rank() over(partition by player_id order by event_date) as rnk
from activity) as a
where rnk =1;