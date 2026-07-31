CREATE DATABASE IF NOT EXISTS practice;
USE practice;
SELECT * FROM smartphones_data;

-- Q.07: find the phone with 2nd largest battery CAPACITY?

-- STEP1: SORTING

SELECT model, battery_capacity FROM smartphones_data ORDER BY battery_capacity DESC;

-- FIND THE SOLUTION USING LIMIT X,Y
-- LIMIT offset, count;
-- LIMIT 5, 10
-- Skip the first 5 rows.
-- Return the next 10 rows.


SELECT model, battery_capacity FROM smartphones_data ORDER BY battery_capacity DESC LIMIT 1,1;

SELECT model, battery_capacity FROM smartphones_data ORDER BY battery_capacity DESC LIMIT 3,2;
