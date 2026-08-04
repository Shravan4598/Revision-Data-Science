

-- Q02: Find all the movies made by top 3 directors(in terms of total gross income)

USE movie;

SELECT * FROM movies;

SELECT director FROM movies GROUP BY director ORDER BY SUM(gross) DESC LIMIT 3;



