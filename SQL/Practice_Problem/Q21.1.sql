CREATE DATABASE IF NOT EXISTS practice;
USE practice;
SELECT * FROM smartphones_data;

-- 

SELECT brand_name, COUNT(*) AS 'count', AVG(price) AS 'avg_price'
FROM smartphones_data 
GROUP BY brand_name
ORDER BY avg_price DESC;

SELECT brand_name, COUNT(*) AS 'count', AVG(price) AS 'avg_price'
FROM smartphones_data 
GROUP BY brand_name
HAVING count>20
ORDER BY avg_price DESC;