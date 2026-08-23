# Aman
select product_id, product_name, description
from products
where regexp_like(
description,
'(^|[^A-Za-z0-9])SN[0-9]{4}-[0-9]{4}([^A-Za-z0-9]|$)','c' 
)
order by product_id;
