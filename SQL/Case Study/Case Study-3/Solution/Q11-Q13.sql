

-- Q11. Find quarter wise number of flights for each airline?

SELECT airline, QUARTER(Departure), COUNT(*) FROM flights
GROUP BY airline,QUARTER(Departure);



-- Q12. Find the longest flight distance(between cities in terms of time) in India?

SELECT * FROM flights;

SELECT Airline,Source,Destination,Duration FROM flights ORDER BY duration_min DESC;

SELECT Airline,Source,Destination,Duration FROM flights ORDER BY duration_min DESC LIMIT 1;

-- Q13. Average time duration for flights that have 1 stop vs more than 1 stops

SELECT * FROM flights;
SELECT Total_Stops,AVG(duration_min) FROM flights GROUP BY Total_Stops;

WITH temp_table AS (SELECT *, 
CASE WHEN Total_Stops='1 stop' THEN "1 stop"
WHEN Total_Stops IN ('2 stops','3 stops','4 stops' ) THEN "more than 1 stop"
END AS "temp"
FROM flights)

SELECT temp,TIME_FORMAT(SEC_TO_TIME(AVG(duration_min)*60),"%kh %im") FROM temp_table GROUP BY temp;
