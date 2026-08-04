

-- Q03.Find the highest rated movie of 2000?

SELECT * FROM movies;

SELECT * FROM movies WHERE year=2000 ORDER BY score DESC;

SELECT * FROM movies WHERE year=2000 ORDER BY score DESC LIMIT 1;

-- SUBQUERIES

SELECT * FROM movies WHERE year=2000 AND score=(SELECT MAX(score) FROM movies WHERE year=2000);
