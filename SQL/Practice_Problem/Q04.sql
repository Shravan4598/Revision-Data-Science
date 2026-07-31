CREATE DATABASE IF NOT EXISTS practice;
USE practice;
SELECT * FROM smartphones_data;


-- Q.04: find top 5 samsung phones with biggest screen size.

SELECT * FROM smartphones_data WHERE brand_name='samsung' ORDER BY screen_size DESC LIMIT 5;
SELECT model,screen_size FROM smartphones_data WHERE brand_name='samsung' ORDER BY screen_size DESC LIMIT 5;