# Aman
with exam_score as
(select student_id, subject,
first_value(score) over(partition by student_id,subject order by exam_date asc)as first_score,
first_value(score) over(partition by student_id,subject order by exam_date desc) as latest_score
from scores)
select distinct *
from exam_score
where first_score<latest_score;
