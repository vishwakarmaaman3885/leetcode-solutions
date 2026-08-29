# Aman
select user_id,
round(avg(if(activity_type = "free_trial", activity_duration,Null)),2) as
trial_avg_duration,
round(avg(if(activity_type = "paid",activity_duration,null)),2) as
paid_avg_duration
from useractivity
group by user_id
having trial_avg_duration is not null and  paid_avg_duration is not null
order by user_id;