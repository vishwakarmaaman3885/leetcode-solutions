select employee_id, department_id
from (select *, count(*) over(partition by employee_id) as cnt
from employee) as a

where primary_flag = "Y" or cnt=1;

