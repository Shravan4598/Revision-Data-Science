
-- Q17. Make a weekday vs time grid showing frequency of flights from Bangalore and Delhi?

SELECT * FROM flights;

SELECT * FROM flights WHERE Source='Banglore' AND Destination='Delhi';

SELECT DAYNAME(Departure) FROM flights 
WHERE Source='Banglore' AND Destination='Delhi' 
GROUP BY DAYNAME(Departure),DAYOFWEEK(Departure)
ORDER BY DAYOFWEEK(Departure) ASC;

SELECT DAYNAME(Departure),
SUM(CASE WHEN HOUR(Departure) BETWEEN 0 AND 5 THEN 1 ELSE 0 END) AS "12AM - 6 AM"
FROM flights 
WHERE Source='Banglore' AND Destination='Delhi' 
GROUP BY DAYNAME(Departure),DAYOFWEEK(Departure)
ORDER BY DAYOFWEEK(Departure) ASC;

SELECT DAYNAME(Departure),
SUM(CASE WHEN HOUR(Departure) BETWEEN 0 AND 5 THEN 1 ELSE 0 END) AS "12 AM - 6 AM",
SUM(CASE WHEN HOUR(Departure) BETWEEN 6 AND 11 THEN 1 ELSE 0 END) AS "6 AM - 12 PM",
SUM(CASE WHEN HOUR(Departure) BETWEEN 12 AND 17 THEN 1 ELSE 0 END) AS "12 PM - 6 PM",
SUM(CASE WHEN HOUR(Departure) BETWEEN 18 AND 23 THEN 1 ELSE 0 END) AS "6 PM - 12 PM"
FROM flights 
WHERE Source='Banglore' AND Destination='Delhi' 
GROUP BY DAYNAME(Departure),DAYOFWEEK(Departure)
ORDER BY DAYOFWEEK(Departure) ASC;


