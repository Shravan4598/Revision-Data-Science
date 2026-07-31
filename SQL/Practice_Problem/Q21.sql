CREATE DATABASE IF NOT EXISTS practice;
USE practice;
SELECT * FROM smartphones_data;

-- Q.21: find the avg rating of smartphone brands which have more than 20 phones?

SELECT brand_name, 
AVG(rating) AS 'rating', 
COUNT(*) AS 'count'  
FROM smartphones_data
GROUP BY brand_name
HAVING count>20;
