CREATE DATABASE IF NOT EXISTS practice;
USE practice;
SELECT * FROM smartphones_data;

-- Q.03: Find the number of smartphones with 5G capability.

SELECT COUNT(*) FROM smartphones_data WHERE has_5g='True';