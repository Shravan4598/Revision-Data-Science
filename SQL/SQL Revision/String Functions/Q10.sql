

-- Q10. display the length of a movie name?


SELECT name, LENGTH(name),CHAR_LENGTH(name) FROM movies;

SELECT name, LENGTH(name),CHAR_LENGTH(name) FROM movies
WHERE LENGTH(name)!=CHAR_LENGTH(name);

SELECT LENGTH("Café"),CHAR_LENGTH("Café");
-- LENGTH=5
-- CHAR_LENGTH=4


