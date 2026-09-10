# Aman
with weekly_meetings as(
    select employee_id, year(meeting_date) as year,
    week(meeting_date,1) as weak, sum(duration_hours) as total_hours
    from meetings
    group by employee_id, year(meeting_date),week(meeting_date,1)) 
    select e.employee_id, e.employee_name, e.department,
    count(*) as meeting_heavy_weeks
    from weekly_meetings as w
    join employees as e on w.employee_id = e.employee_id
    where w.total_hours>20
    group by e.employee_id, e.employee_name, e.department
    having count(*)>=2
    order by meeting_heavy_weeks desc, e.employee_name asc;