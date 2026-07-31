CREATE DATABASE IF NOT EXISTS practice;
USE practice;
SELECT * FROM smartphones_data;

-- Q.19: Find all samsung 5g enabled smartphones and find out the avg price for NFC and Non-NFC phones


SELECT brand_name,has_5g, AVG(price) AS 'avg_price', has_nfc FROM smartphones_data
WHERE has_5g='True' AND brand_name='samsung' GROUP BY has_nfc;