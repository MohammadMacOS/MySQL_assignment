SHOW DATABASES;
#skapa Database med namn assignment
CREATE DATABASE assignment;
# Skapa förtfattare tabell
CREATE TABLE authors(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

# Skapa kategori tabell
CREATE TABLE categories(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

DROP TABLE categories;
# Skapa böcker tabell
CREATE TABLE books(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(90) NOT NULL,
    authorId INT NOT NULL, FOREIGN KEY (authorId) REFERENCES authors(id),
    description VARCHAR(300) NOT NULL,
    year INT NOT NULL,
    price INT NOT NULL,
    categoryId INT, FOREIGN KEY (categoryId) REFERENCES categories(id)
);


SHOW TABLES;


DESCRIBE authors;
DESCRIBE books;
DESCRIBE categories;

INSERT INTO authors(name)
VALUES ('Mons Kallentoft'),
       ( 'Kristina Ohlsson'),
       ( 'Adam and Becky'),
       ( 'Adam Silver'),
       ( 'Miller Madeline'),
       ( 'Charlie DAmelio'),
       ( 'Elin Ek'),
       ( 'Caroline Engvall');

SHOW TABLES;

SET FOREIGN_KEY_CHECKS=0;
##  för att lösa insert categoryId

INSERT INTO books( title, authorId, description, year, price, categoryId)
VALUES ('Satans', 1, 'Trettonde boken i Mons Kallentofts hyllade serie om kriminalinspektör Malin Fors',2000 , 60, 9),
       ( 'Stormvakt', 2, 'Efter en räcka framgångsrika spänningsromaner startar Kristina Ohlsson med Stormvakt en ny deckarserie', 2005 , 119, 10),
       ( 'What If It is Us', 3, 'Adam and Becky come to collaboration about two very different boys who can not decide if the universe is pushing them together or pulling them apart ',2018, 99 , 11),
       ( 'The Song of Achilles', 4, 'WINNER OF THE ORANGE WOMEN PRIZE FOR FICTION', 2017 , 125, 12),
       ( 'Essentially Charlie', 6, 'Charlie D’Amelio is the only TikTok personality to have surpassed 100 million followers', 1990 , 141, 14),
       ( 'Det är aldrig för sent', 7, 'julaftonskänsla!', 2021 , 130, 15),
       ( 'Noelia hemlighet', 8, 'Viktigt och aktuellt!TV4 Nyhetsmorgon', 2020 , 110, 16);


INSERT INTO categories (name)
VALUES ( 'Adventure'),
       ( 'Action'),
       ( 'Thriller'),
       ( 'Horror'),
       ( 'Comedy'),
       ( 'Mystery'),
       ( 'Drama'),
       ( 'Fantasy');
# Read
SELECT * FROM authors;
SELECT * FROM books;
SELECT * FROM categories;
SHOW TABLES ;

# Update an book id
UPDATE books SET price = 190
WHERE id = 1;

SELECT * FROM books;


SELECT title, authorId FROM books;

## Get Categories name and book description
SELECT categories.name ,books.description FROM books
INNER JOIN categories on books.categoryId = categories.id;

# Get a categories name and book title with categorie name Fantasy
SELECT categories.name, books.title
FROM books INNER JOIN categories ON books.categoryId = categories.id
WHERE categories.name = 'Fantasy';

# Get authors name and book's title
SELECT authors.name, books.title
FROM books INNER JOIN authors on books.authorId = authors.id
WHERE authors.name = 'Elin Ek';

SELECT categories.name, books.title
FROM books INNER JOIN categories ON books.categoryId = categories.id
WHERE categories.name = 'Thriller';

SELECT authors.name, books.title
FROM books INNER JOIN authors ON books.authorId = authors.id
WHERE authors.id  IS NULL;

SELECT * FROM authors;
SELECT * FROM books;

# Delete
DELETE FROM books WHERE price = 125;
SELECT * FROM books;

DELETE FROM caterogies WHERE id = 1;

SELECT * FROM caterogies;



