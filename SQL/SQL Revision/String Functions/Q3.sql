

-- Q3.Display the movies name and its director with star?
-- Movie_name ---> Director_name ---> Star_name


USE movie;

SELECT CONCAT_WS(" ---> ",name,director,star) FROM movies;