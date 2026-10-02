
    with cte as(select *, lag(people,1) over(order by id) as prev1,
    lag(people,2) over(order by id) as prev2,
    lead(people,1) over(order by id) as next,
    lead(people,2) over(order by id) as next_to_next
    from stadium)
    select id,visit_date, people
    from cte
    where people>=100
    and (
        (prev1>=100 and prev2>=100)
        or(prev1>=100 and next>=100)
        or(next>=100 and next_to_next>=100)
    )
    order by visit_date;

