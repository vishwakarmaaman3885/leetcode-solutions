with cte as
(select query_name,result,position,rating
from queries )
select query_name, round(avg(rating/position),2) as quality,
round(count(case when rating<3 then result end)*100.0/count(rating),2)
as poor_query_percentage
from cte
group by query_name