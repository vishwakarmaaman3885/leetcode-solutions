select name
from salesperson
where sales_id not in (select o.sales_id
from orders as o 
join company as c on c.com_id = o.com_id
where c.name = 'Red')