select p.product_id,p.product_name
from product as p
join sales as s on p.product_id = s.product_id
group by p.product_id
having min(sale_date)>='2019-01-01'
and max(sale_date)<='2019-03-31';