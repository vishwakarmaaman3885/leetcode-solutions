#Aman
select l.book_id,l.title,l.author,l.genre,l.publication_year,
count(*) as current_borrowers
from library_books as l
join borrowing_records as b on l.book_id = b.book_id
where b.return_date is null
group by l.book_id,l.title,l.author,l.genre,l.publication_year,
l.total_copies
having count(*) = l.total_copies
order BY current_borrowers desc, l.title; 



