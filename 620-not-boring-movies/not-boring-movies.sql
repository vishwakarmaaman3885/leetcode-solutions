select *
from (select id, movie,description,rating
from cinema
where description != 'boring' and id % 2=1
order by rating desc) as a;
