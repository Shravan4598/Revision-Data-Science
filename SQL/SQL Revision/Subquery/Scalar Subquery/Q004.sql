

-- Q04.Find the highest rated movie among all movies whose number of votes are > the dataset avg votes

SELECT * FROM movies;

SELECT AVG(votes) FROM movies;
 
SELECT * FROM movies WHERE votes>(SELECT AVG(votes) FROM movies) ORDER BY score DESC LIMIT 1;


--                 OR

SELECT AVG(votes) FROM movies;

SELECT * FROM movies WHERE votes>(SELECT AVG(votes) FROM movies);
SELECT MAX(score) FROM movies WHERE votes>(SELECT AVG(votes) FROM movies);

SELECT * FROM movies WHERE score=(SELECT MAX(score) FROM movies WHERE votes>(SELECT AVG(votes) FROM movies));
