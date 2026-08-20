select query_name,
round(avg(rating/position),2) as quality, 
round(count(CASE when rating<3 then result  end)*100.00/count(rating),2) as
poor_query_percentage
from queries
group by query_name;