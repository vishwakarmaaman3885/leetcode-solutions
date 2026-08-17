-- Aman
select class
from (select class,count(distinct student ) as c
from courses
group by class) as a
where c>=5;

