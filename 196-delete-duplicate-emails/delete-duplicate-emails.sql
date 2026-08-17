-- Aman

DELETE p2
from person as p1
join person as p2 on p1.email = p2.email
where p1.id<p2.id;
