# Aman
with cte as(
    select case
    when month(sale_date) in(12,1,2) then 'Winter'
    when month(sale_date) in(3,4,5) then 'Spring'
    when month(sale_date) in(6,7,8) then 'Summer'
    else "Fall" end as Season, category,
    sum(quantity) as total_quantity,
    sum(price*quantity) as total_revenue
    from sales as s 
    join products as p on s.product_id = p.product_id
    group by season, category
)
,ranked_categories as(
    select *, dense_rank() over(partition by season order by total_quantity desc,  total_revenue desc) as rnk
    from cte)
    select season, category, total_quantity, total_revenue
    from ranked_categories
    where rnk = 1
    order by season 