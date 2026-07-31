CREATE DATABASE IF NOT EXISTS practice;
USE practice;
SELECT * FROM smartphones_data;

-- Q.13: Group smartphones by the extended memory available and get the average price?

SELECT extended_memory_available, AVG(price) AS 'aVg_price'FROM smartphones_data GROUP BY extended_memory_available;

