with cte as (select customer_id, 
count(*) as total_orders,
round(sum(time(order_timestamp ) between '11:00:00' and '14:00:00'
or time(order_timestamp ) between '18:00:00' and '21:00:00')/count(*)*100) as peak_hour_percentage,
round(avg(order_rating),2) as average_rating
from restaurant_orders
group by customer_id 
having total_orders>=3 and peak_hour_percentage>=60
and average_rating>=4
and sum(order_rating is not null)/total_orders>=0.50
ORDER BY average_rating DESC, customer_id DESC)
select customer_id, total_orders , peak_hour_percentage,
average_rating 
from cte;


