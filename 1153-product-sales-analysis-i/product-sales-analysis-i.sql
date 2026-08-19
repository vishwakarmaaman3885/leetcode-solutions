select *
from (select p.product_name as product_name,s.year as year,s.price as price
from sales as s 
join product as p on s.product_id = p.product_id) a
