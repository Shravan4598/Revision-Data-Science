

-- Q03: Find all movies of all those actors whose filmography's avg rating > 8.5(take 25000 votes as cutoff)?


SELECT * FROM movies;


SELECT star,AVG(score) as 'avg_score' FROM movies WHERE votes>25000 GROUP BY star HAVING avg_score>8.5;

SELECT star FROM movies WHERE votes>25000 GROUP BY star HAVING AVG(score)>8.5;

SELECT name FROM movies WHERE 
star IN (SELECT star FROM movies WHERE votes>25000 GROUP BY star HAVING AVG(score)>8.5)
AND votes>25000;