# Aman
select round(sum(case when order_date = customer_pref_delivery_date then 1 else
 0 end )
*100/count(distinct customer_id),2) as immediate_percentage
from (
    select *, row_number() over(partition by customer_id order by order_date) as rnk
    from delivery
) as a
where rnk = 1;
