CREATE DATABASE IF NOT EXISTS practice;
USE practice;
SELECT * FROM smartphones_data;

-- Q.12: Group smartphones by whether they have an NFC and get the average price and rating?

SELECT has_nfc, AVG(price) AS 'avg_price', AVG(rating) AS 'avg_rating' FROM smartphones_data GROUP BY has_nfc;
