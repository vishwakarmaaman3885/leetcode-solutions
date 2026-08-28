# Aman
select visited_on, amount, round((amount/7),2) as average_amount
from( select visited_on,
sum(daily_amount) 
over(order by visited_on  rows between 6 preceding and current row) as amount, row_number() over(order by visited_on ) as rn
from(
    select visited_on, sum(amount) as daily_amount
    from customer
    group by visited_on
)d)t
where rn>=7;


