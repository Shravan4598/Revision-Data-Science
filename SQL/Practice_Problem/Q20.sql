CREATE DATABASE IF NOT EXISTS practice;
USE practice;
SELECT * FROM smartphones_data; 

-- Q.20: find the phone name, price of the costliest phone?

SELECT model, price FROM smartphones_data ORDER BY price DESC LIMIT 1;