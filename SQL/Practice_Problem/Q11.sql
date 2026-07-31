CREATE DATABASE IF NOT EXISTS practice;
USE practice;
SELECT * FROM smartphones_data;

-- Q.11: Group smartphones by brand and get the count, average price, max rating, avg screen size and avg battery capacity?

SELECT brand_name,COUNT(*) FROM smartphones_data GROUP BY brand_name ;

SELECT brand_name,COUNT(*) AS 'num_phones' FROM smartphones_data GROUP BY brand_name ORDER BY num_phones DESC;

SELECT brand_name,COUNT(*) AS 'num_phones', AVG(price) AS 'avg_price' 
FROM smartphones_data GROUP BY brand_name ORDER BY num_phones DESC;

SELECT brand_name,COUNT(*) AS 'num_phones', 
AVG(price) AS 'avg_price' ,MAX(rating) AS 'max_rating', AVG(screen_size) AS 'avg_screen_size',
AVG(battery_capacity) AS 'avg_battery_capacity'
FROM smartphones_data GROUP BY brand_name ORDER BY num_phones DESC;

