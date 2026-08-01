CREATE DATABASE IF NOT EXISTS practice;
USE practice;
SELECT * FROM ipl_dataset;

-- Q.26: Find Virat Kohli's performance against all IPL teams?

SELECT BowlingTeam,SUM(batsman_run) AS 'total_run' FROM ipl_dataset
WHERE batter='V Kohli' GROUP BY BowlingTeam;