

-- Q5. Dispaly the first five last characters of the movie name?

USE movie;

SELECT name,SUBSTR(name,-5) FROM movies;

SELECT name,SUBSTR(name,-1) FROM movies;

SELECT name,SUBSTR(name,-5,1) FROM movies;

SELECT name,SUBSTR(name,-5,2) FROM movies;

SELECT name,SUBSTR(name,-5,3) FROM movies;