# Aman
select u.user_id as buyer_id, u.join_date as join_date, 
count(order_date) as orders_in_2019
from users as u
left join orders as o on u.user_id = o.buyer_id and
year(o.order_date) = '2019'
group by user_id

