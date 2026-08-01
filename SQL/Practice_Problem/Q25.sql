CREATE DATABASE IF NOT EXISTS practice;
USE practice;
SELECT * FROM ipl_dataset;

-- Q.25: find the 2nd highest 6 hitter in IPL?

SELECT batter, COUNT(*) AS 'num_of_sixes' 
FROM ipl_dataset WHERE batsman_run=6 
GROUP  BY batter
ORDER BY num_of_sixes DESC;

SELECT batter, COUNT(*) AS 'num_of_sixes' 
FROM ipl_dataset WHERE batsman_run=6 
GROUP  BY batter
ORDER BY num_of_sixes DESC
LIMIT 1,1;


