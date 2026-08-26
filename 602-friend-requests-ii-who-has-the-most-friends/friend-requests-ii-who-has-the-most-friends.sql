# Aman
with friends as(
    select requester_id
    from requestaccepted
    union all
    select accepter_id
    from requestaccepted
)
select requester_id as id, count(*) as num
from friends
group by requester_id
order by num desc
limit 1;
