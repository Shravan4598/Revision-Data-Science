CREATE DATABASE IF NOT EXISTS practice;
USE practice;
SELECT * FROM ipl_dataset;

-- Q.28: find the top 5 batsman with highest strike rate who have played a min of 100 balls?

SELECT batter, SUM(batsman_run)*100/COUNT(*) AS 'strike_rate'
FROM ipl_dataset
GROUP BY batter HAVING count(*)>=100
ORDER BY strike_rate DESC
LIMIT 5;