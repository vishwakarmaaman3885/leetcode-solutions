with cte as 
(select p.product_name, o.unit
from products as p 
join orders as o on p.product_id = o.product_id
where order_date between '2020-02-01' and '2020-02-29')
select product_name, sum(unit) as unit
from cte
group by product_name
having sum(unit)>=100;