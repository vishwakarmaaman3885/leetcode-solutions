# Aman
select product_id, year as first_year, quantity, price
from (select *, dense_rank() over(partition by product_id order by year) as rnk
from sales) as a
where rnk = 1;
