

-- Q2. Find the highest rated movie of each genre votes cutoff of 25000?

SELECT genre,MAX(score) FROM movies WHERE votes>25000 GROUP BY genre;

SELECT * FROM movies WHERE 
(genre,score) IN 
(SELECT genre,MAX(score) FROM movies WHERE votes>25000 GROUP BY genre);

SELECT * FROM movies WHERE 
(genre,score) IN 
(SELECT genre,MAX(score) FROM movies WHERE votes>25000 GROUP BY genre)
AND votes>25000;