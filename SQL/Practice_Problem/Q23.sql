CREATE DATABASE IF NOT EXISTS practice;
USE practice;
SELECT * FROM smartphones_data;

-- Q.23: find the avg price of all the phone brands with avg rating > 70 and num_phones more than 10 among all 5g enabled phones?

SELECT brand_name, AVG(price) AS 'price'
FROM smartphones_data
WHERE has_5g='True' 
GROUP BY brand_name
HAVING AVG(rating)>70 AND COUNT(*)>10;