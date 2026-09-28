select t.request_at as day, 
round(avg(t.status != 'completed'),2) as 'Cancellation Rate' 
from trips as t 
join users as u on t.client_id = u.users_id
join users as d on t.driver_id = d.users_id
where u.banned = 'NO' 
and d.banned = 'NO'
and t.request_at between "2013-10-01" and "2013-10-03"
group by request_at ;