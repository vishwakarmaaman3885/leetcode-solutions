# Aman
select user_id,
round(avg(case when activity_type = "free_trial" then activity_duration end),2) as
trial_avg_duration,
round(avg(case when activity_type  = "Paid" then activity_duration end),2) as
paid_avg_duration
from userActivity
group by user_id
having sum(activity_type = "Paid")>0 and trial_avg_duration is not null
order by user_id ; 