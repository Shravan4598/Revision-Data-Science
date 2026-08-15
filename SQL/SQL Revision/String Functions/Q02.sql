

-- Q2.Display the movies name and its director with star?
-- Movie_name ---> Director_name and Star_name


USE movie;

SELECT CONCAT(name," ---> ",director, ' and ',star) FROM movies;
