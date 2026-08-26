# Aman
select requester_id as id, count(requester_id) as num
from(select requester_id
from requestaccepted
union all
select accepter_id
from requestaccepted) as count
group by id
order by num desc
limit 1;
