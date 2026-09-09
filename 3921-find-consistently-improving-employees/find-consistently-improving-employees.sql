# Aman
with ranked as(
    select p.employee_id, p.review_date,e.name, p.rating,
    row_number() over(partition by p.employee_id order by p.review_date desc) as rn
    from performance_reviews as p
    join employees as e on e.employee_id = p.employee_id
    ),
    last3 as(
        select *
        from ranked
        where rn<=3
    ),
    increases as( select *,
    lag(rating,1) over(partition by employee_id order by review_date) as prev,
    lag(rating,2) over(partition by employee_id order by review_date) as prev2
    from last3)
select employee_id,name ,
rating-prev2 as improvement_score
from increases
where prev2 is not null and rating>prev and prev>prev2
order by improvement_score desc,name;