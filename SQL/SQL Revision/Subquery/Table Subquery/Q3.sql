

-- Q3. Find the highest grossing movies of top 5 actor/director combo in terms of total gross income?

SELECT * FROM movies;


SELECT star,director,MAX(gross) FROM movies GROUP BY star,director;

SELECT * FROM movies 
WHERE (star,director,gross) 
IN (SELECT star,director,MAX(gross) FROM movies GROUP BY star,director)
ORDER BY gross DESC; 