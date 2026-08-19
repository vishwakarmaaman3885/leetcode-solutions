select p.project_id as project_id, round(avg(experience_years),2) as average_years
from project as p
join employee as e on p.employee_id = e.employee_id
group by project_id

