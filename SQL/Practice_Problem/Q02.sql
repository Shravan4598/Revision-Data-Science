CREATE DATABASE IF NOT EXISTS practice;
USE practice;

-- Q.02: Find the average internal memory capacity of smartphones that have a 
-- refresh rate of 120 Hz or higher and a front-facing camera resolution greater than or equal to 20 megapixels.

SELECT * FROM smartphones_data;

SELECT AVG(internal_memory) FROM smartphones_data WHERE refresh_rate>=120 AND primary_camera_front>=20;