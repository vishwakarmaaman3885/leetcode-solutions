# Aman
with first_half as(
select d.driver_id, d.driver_name, 
    sum(distance_km/fuel_consumed)/count(trip_id ) as first_half_avg
    from drivers as d join trips as t on d.driver_id = t.driver_id
    where t.trip_date between '2023-01-01' and '2023-06-30'
    group by d.driver_id, d.driver_name)
    , second_half as(
        select d.driver_id, d.driver_name,
    sum(distance_km/fuel_consumed)/count(trip_id ) as second_half_avg
    from drivers as d join trips as t on d.driver_id = t.driver_id
    where t.trip_date between '2023-07-01' and '2023-12-31'
    group by d.driver_id, d.driver_name
    ),
    all_drivers as(
        select f.driver_id, f.driver_name,
        round(f.first_half_avg,2) as first_half_avg,
        round(s.second_half_avg,2) as second_half_avg,
        round(s.second_half_avg-f.first_half_avg,2) as efficiency_improvement
        from first_half as f join second_half as s on f.driver_id = s.driver_id)
select  driver_id,driver_name , first_half_avg,second_half_avg,efficiency_improvement
from all_drivers
where efficiency_improvement>0
order by efficiency_improvement desc, driver_name;