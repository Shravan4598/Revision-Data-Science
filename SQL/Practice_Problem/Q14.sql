CREATE DATABASE IF NOT EXISTS practice;
USE practice;
SELECT * FROM smartphones_data;

-- Q.14: Group smartphones by the brand and processor brand 
-- and get the count of models and the average primary camera resolution (rear)

SELECT brand_name,processor_brand, COUNT(*) AS 'num_model',  
AVG(primary_camera_rear) AS 'avg_priamry_camera_rear' 
FROM smartphones_data GROUP BY brand_name,processor_brand;