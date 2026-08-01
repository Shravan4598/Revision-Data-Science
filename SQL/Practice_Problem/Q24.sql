CREATE DATABASE IF NOT EXISTS practice;
USE practice;
SELECT * FROM ipl_dataset;

-- Q.24: find the top 5 batsman in IPL?

SELECT batter, SUM(batsman_run) AS 'total_run_batsman' 
FROM ipl_dataset GROUP BY batter ORDER BY total_run_batsman DESC LIMIT 5;

SELECT COUNT(*) FROM ipl_dataset;