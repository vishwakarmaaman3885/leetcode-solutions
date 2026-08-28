# Aman
with cte as (select stock_name, sum(price) as gained
from stocks
where operation = "Sell"
group by stock_name),
ct as( select stock_name, sum(price) as spent
from stocks
where operation = "Buy"
group by stock_name) 
select a.stock_name, gained-spent as capital_gain_loss
from cte as a
join ct as b on a.stock_name = b.stock_name;