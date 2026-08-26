# Aman
select id,
if(
    P_id is null,"Root",
    if (
        id in (select p_id from tree where p_id is not null),
        'Inner',
        'Leaf')
) as type
from tree
group by id; 
