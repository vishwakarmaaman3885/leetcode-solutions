# Aman
create function getNthHighestSalary (n int) returns int
begin
return(select salary
from(select salary,dense_rank() over(order by salary desc) as rnk
from employee) ranked
where rnk = n
limit 1);
end