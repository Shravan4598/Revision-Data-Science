

-- Q7. Replace  man with woman in the movie name?

SELECT name,REPLACE(name,"man","woman") FROM movies WHERE name LIKE "%man%";