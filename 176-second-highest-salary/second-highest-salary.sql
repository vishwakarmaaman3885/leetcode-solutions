select distinct max(salary) as SecondHighestSalary
from employee
where  salary < (select max(salary) as high
from employee );