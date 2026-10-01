with cte as (select product_name, year, price
from sales as s
join product as p on s.product_id = p.product_id)
select product_name, year, price
from cte;

