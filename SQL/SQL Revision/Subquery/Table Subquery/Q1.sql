

-- Q1. Find the most profitable movie of each year?

USE movie;

SELECT * FROM movies;

SELECT year,MAX(gross-budget) FROM movies GROUP BY year;

SELECT * FROM movies
WHERE (year,gross-budgeT) IN 
(SELECT year,MAX(gross-budget) FROM movies GROUP BY year);
