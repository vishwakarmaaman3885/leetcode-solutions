select distinct v.author_id as id
from views as v
join views as v1 on v.author_id = v1.viewer_id
where v.viewer_id = v.author_id
order by id;