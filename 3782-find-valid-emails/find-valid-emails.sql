# Aman
select user_id,email
from users
where email regexp'^[A-Za-z0-9_]+@[A-Za-z]+\\.com$'
order by user_id;

