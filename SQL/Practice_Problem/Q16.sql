CREATE DATABASE IF NOT EXISTS practice;
USE practice;
SELECT * FROM smartphones_data;

-- Q.16: which brand makes the smallest screen smartphones?

SELECT brand_name, MIN(screen_size) AS 'min_screen_size' 
FROM smartphones_data GROUP BY brand_name ORDER BY min_screen_size ASC LIMIT 1;

