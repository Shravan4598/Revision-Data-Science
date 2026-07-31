CREATE DATABASE IF NOT EXISTS practice;
USE practice;
SELECT * FROM smartphones_data;

-- Q.22: Find the top 3 brands with the highest avg ram that have a refresh rate of at least 90 Hz 
-- and fast charging available and dont consider brands which have less than 10 phones?

SELECT brand_name, 
AVG(ram_capacity) AS 'avg_ram',
COUNT(*) AS 'count'
FROM smartphones_data
WHERE fast_charging_available=1 AND refresh_rate>=90
GROUP BY brand_name 
HAVING count>=10
ORDER BY avg_ram DESC
LIMIT 3;

SELECT brand_name, 
AVG(ram_capacity) AS 'avg_ram'
FROM smartphones_data
WHERE fast_charging_available=1 AND refresh_rate>=90
GROUP BY brand_name 
HAVING COUNT(*)>=10
ORDER BY avg_ram DESC
LIMIT 3;

