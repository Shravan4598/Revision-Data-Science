CREATE DATABASE IF NOT EXISTS practice;
USE practice;
SELECT * FROM smartphones_data;

-- Q.15: find top 5 most costly phone brands?

SELECT brand_name,MAX(price) AS 'MAX_price' FROM smartphones_data GROUP BY 	brand_name ORDER BY max_price DESC LIMIT 5;