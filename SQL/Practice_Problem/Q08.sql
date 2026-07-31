CREATE DATABASE IF NOT EXISTS practice;
USE practice;
SELECT * FROM smartphones_data;

-- Q.08: find the name and rating of the worst rated apple phone?

SELECT model,rating FROM smartphones_data WHERE brand_name='apple' ORDER BY rating ASC;

SELECT model,rating FROM smartphones_data WHERE brand_name='apple' ORDER BY rating ASC LIMIT 1;