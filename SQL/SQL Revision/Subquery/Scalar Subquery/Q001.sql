CREATE DATABASE IF NOT EXISTS movie;
USE movie;

-- Q01.Find the movie with highest profit(vs order by)

SELECT * FROM movies;

SELECT * FROM movies ORDER BY (gross-budget) DESC LIMIT 1;

 -- SUBQUIRIES
 
SELECT * FROM movies WHERE (gross-budget)= (SELECT MAX(gross-budget) FROM movies);