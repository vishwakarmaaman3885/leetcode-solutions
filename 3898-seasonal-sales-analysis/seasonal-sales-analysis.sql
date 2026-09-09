# Aman
select season,category,total_quantity,total_revenue
from 
(select case 
when month(sale_date) between 3 and 5 then  "Spring"
when month(sale_date) between 6 and 8 then  "Summer"
when month(sale_date) between 9 and 11 then "Fall" 
else 'Winter' end as season, category,
sum(quantity) as total_quantity ,
sum(quantity*price) as total_revenue
from sales as s 
join products as p on s.product_id = p.product_id
group by season,category
order by total_quantity desc, total_revenue desc) as a
group by season
order by season;