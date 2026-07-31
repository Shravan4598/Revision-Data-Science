CREATE DATABASE IF NOT EXISTS practice;
USE practice;
SELECT * FROM smartphones_data;

-- Q.17: Avg price of 5g phones vs avg price of non 5g phones?

SELECT has_5g, AVG(price) AS 'avg_price' FROM smartphones_data GROUP BY has_5g;