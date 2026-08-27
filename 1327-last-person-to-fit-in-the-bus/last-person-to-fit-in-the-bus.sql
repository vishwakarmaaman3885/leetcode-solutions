# Aman
select q1.person_name as person_name
from queue as q1
join queue as q2 on q1.turn>=q2.turn
group by q1.turn, q1.person_name
having sum(q2.weight)<=1000
order by q1.turn desc
limit 1;
