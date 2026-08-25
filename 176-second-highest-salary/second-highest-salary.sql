# Aman
select max(salary) as secondhighestsalary
from (select *, dense_rank() over(order by salary desc) as rnk
from employee) as a
where rnk = 2;
