
-- Q5. Display all the movies name having "man" at the start of the  movie name?

USE movie;

SELECT name FROM movies WHERE name LIKE 'man%';