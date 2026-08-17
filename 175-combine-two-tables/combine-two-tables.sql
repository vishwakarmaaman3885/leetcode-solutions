select p.firstname as firstname, p.lastname as lastname,
a.city as city, a.state as state
from person as p 
left join address as a on p.personid = a.personid;

-- Aman
