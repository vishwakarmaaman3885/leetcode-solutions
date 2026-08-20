select s.student_id, s.student_name, su.subject_name, count(e.student_id) as attended_exams
from students as s
cross join subjects as su
left join examinations as e on e.student_id = s.student_id and e.subject_name = su.subject_name
group by s.student_id, s.student_name, su.subject_name
order by s.student_id, su.subject_name;

