# 
with cte as(select  u.name as title, count(*) as rating_count
from users as u join movierating as r on u.user_id = r.user_id 
group by u.user_id, u.name),
top_user as( select title
from cte 
order by rating_count desc,title asc
limit 1),
movie_rating as ( select m.title as title, avg(r.rating) as avg_rating
from movies as m join movierating as r on m.movie_id = r.movie_id
where r.created_at between "2020-02-01" and "2020-02-29"
group by m.movie_id, m.title),
top_movies as (select title from movie_rating 
order by avg_rating desc, title asc
limit 1) 
select title as results
from top_user
union all
select title as results
from top_movies;
