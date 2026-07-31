CREATE DATABASE IF NOT EXISTS practice;
USE practice;
SELECT * FROM smartphones_data;

-- Q.06: sort data on the basis of ppi in decreasing order

SELECT SQRT(resolution_width*resolution_width+ resolution_height*resolution_height)/screen_size 
AS 'ppi' FROM smartphones_data ORDER BY ppi DESC;

SELECT model, SQRT(resolution_width*resolution_width+ resolution_height*resolution_height)/screen_size 
AS 'ppi' FROM smartphones_data ORDER BY ppi DESC;