# Aman
(select name as results
from users as u
join movierating as r on u.user_id = r.user_id
group by r.user_id
order by count(*) desc,u.name asc
limit 1)
union all
(select title as results
from movies as m
join movierating as r on m.movie_id = r.movie_id
where r.created_at between "2020-02-01" and "2020-02-29"
group by m.movie_id
order by avg(r.rating) desc, m.title asc
limit 1);