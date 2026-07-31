CREATE DATABASE IF NOT EXISTS practice;
USE practice;
SELECT * FROM smartphones_data;

-- Q.10: sort phones alphabetically and then on the basiS of price in asc order

SELECT * FROM smartphones_data ORDER BY model ASC, price ASC;
