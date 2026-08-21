select product_id
FROM PRODUCTS 
where low_fats = 'Y' and recyclable = 'Y'
group by product_id;
