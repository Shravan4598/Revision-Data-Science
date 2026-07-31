CREATE DATABASE IF NOT EXISTS practice;
USE practice;
SELECT * FROM smartphones_data;

-- Q.09: sort phones alphabetically and then on the basis of rating in desc order

SELECT * FROM smartphones_data ORDER BY model ASC, rating DESC;