CREATE DATABASE IF NOT EXISTS practice;
USE practice;
SELECT * FROM ipl_dataset;

-- Q.27: Find top 10 batsman with centuries in IPL?

SELECT batter, ID,SUM(batsman_run) AS 'run'
FROM ipl_dataset
GROUP BY ID,batter
HAVING run>100 LIMIT 10;

SELECT batter, ID,SUM(batsman_run) AS 'run'
FROM ipl_dataset
GROUP BY ID,batter
HAVING SUM(batsman_run)>=100
ORDER BY run DESC LIMIT 10 ;

