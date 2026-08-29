# Aman
select user_id,
round(avg(if(activity_type = "free_trial",activity_duration,Null)),2) as trial_avg_duration,
round(avg(if(activity_type = "Paid",activity_duration,Null)),2) as  paid_avg_duration
from useractivity
group by user_id
having paid_avg_duration is not null and trial_avg_duration is not null
order by user_id;