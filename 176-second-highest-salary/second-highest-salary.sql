# Aman
select  max(salary) as secondhighestsalary
from employee
where  salary <(select max( salary) as first
from employee);  
