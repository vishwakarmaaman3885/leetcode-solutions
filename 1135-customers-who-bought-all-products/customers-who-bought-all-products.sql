select customer_id
from customer as c
join product as p on c.product_key = p.product_key 
group by customer_id
having count(distinct c.product_key) = (select count(distinct p.product_key) from product as p)