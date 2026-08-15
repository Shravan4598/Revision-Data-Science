

-- Q4. Dispaly the first five characters of the movie name?

USE movie;

SELECT name,SUBSTR(name,1,5) FROM movies;

SELECT name,SUBSTR(name,3,8) FROM movies;

SELECT name,SUBSTR(name,1) FROM movies;

SELECT name,SUBSTR(name,5) FROM movies;

SELECT name,SUBSTR(name,5,5) FROM movies;