CREATE DATABASE IF NOT EXISTS practice;
USE practice;

-- Q.01: Find the average battery capacity and the average primary 
-- rear camera resolution for all smartphones with a price greater than or equal to 100000

SELECT * FROM smartphones_data;

SELECT AVG(battery_capacity)  FROM  smartphones_data WHERE price>=100000;
SELECT AVG(primary_camera_rear) FROM  smartphones_data WHERE price>=100000;

SELECT AVG(battery_capacity) AS 'avg_battery_capacity', AVG(primary_camera_rear) AS 'avg_rear_camaera' 
FROM  smartphones_data WHERE price>=100000;