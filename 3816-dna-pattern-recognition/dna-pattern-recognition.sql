# Aman
select sample_id, dna_sequence, species,
(case when dna_sequence like "ATG%" then 1 else 0 end) as has_start,
(case when dna_sequence like "%TAA"or dna_sequence like "%TAG"
or dna_sequence like "%TGA" then 1 else 0 end ) as has_stop,
(case when dna_sequence like "%ATAT%" then 1 else 0 end ) as has_atat,
(case when dna_sequence like "%GGG%" or dna_sequence like "%GGGG%" then 1 else 0 end) as has_ggg
from samples
group by sample_id;  
