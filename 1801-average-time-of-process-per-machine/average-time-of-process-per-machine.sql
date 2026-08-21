select machine_id,
round(avg(next-timestamp),3) as processing_time
from (select *, 
lead(timestamp) over(partition by machine_id, process_id order by timestamp) as next
from activity) as a
group by machine_id;


# Aman