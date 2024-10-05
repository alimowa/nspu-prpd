SELECT 
    gname, bookname
FROM
    genre
INNER JOIN book ON
	genre.idgenre = book.genre_idgenre
WHERE gname = 'Роман'
ORDER BY bookname;

SELECT 
	bookname, authname
FROM
	book
INNER JOIN author ON
	book.id_book = author.idauthor;
    
SELECT
	bookname, price
FROM
	book AS b
WHERE b.price > 1000;

SELECT
	full_name, bookname, empname
FROM
	reader
INNER JOIN book ON
	book.id_book = reader.id_reader
INNER JOIN employee ON
	employee.id_emp = reader.id_reader;