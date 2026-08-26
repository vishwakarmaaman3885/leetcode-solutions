# Aman
SELECT c.customer_id
FROM Customer as c
join product as p on c.product_key = p.product_key
GROUP BY c.customer_id
HAVING COUNT(DISTINCT c.product_key) = (select COUNT(DISTINCT p.product_key) from product as p);
