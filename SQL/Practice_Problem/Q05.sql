CREATE DATABASE IF NOT EXISTS practice;
USE practice;
SELECT * FROM smartphones_data;

-- Q.05: sort all the phone with in decending order of number of total cameras?

SELECT * FROM smartphones_data ORDER BY num_rear_cameras+num_front_cameras DESC;

SELECT *,
       (num_rear_cameras + num_front_cameras) AS total_cameras
FROM smartphones_data
ORDER BY total_cameras DESC;