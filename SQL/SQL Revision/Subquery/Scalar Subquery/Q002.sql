

-- Q02.Find how many movies have a rating > the avg of all the movie ratings
-- (Find the count of above average movies)?

SELECT * FROM movies;

SELECT AVG(score) FROM movies;

SELECT * FROM movies WHERE score>(SELECT AVG(score) FROM movies);

SELECT COUNT(*) FROM movies WHERE score>(SELECT AVG(score) FROM movies);


