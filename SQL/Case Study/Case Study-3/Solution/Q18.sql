

-- Q18. Make a weekday vs time grid showing avg flight price from Bangalore and Delhi?

-- THIS IS INCORRECT 

SELECT DAYNAME(Departure),
AVG(CASE WHEN HOUR(Departure) BETWEEN 0 AND 5 THEN price ELSE 0 END) AS "12 AM - 6 AM",
AVG(CASE WHEN HOUR(Departure) BETWEEN 6 AND 11 THEN price ELSE 0 END) AS "6 AM - 12 PM",
AVG(CASE WHEN HOUR(Departure) BETWEEN 12 AND 17 THEN price ELSE 0 END) AS "12 PM - 6 PM",
AVG(CASE WHEN HOUR(Departure) BETWEEN 18 AND 23 THEN price ELSE 0 END) AS "6 PM - 12 PM"
FROM flights 
WHERE Source='Banglore' AND Destination='Delhi' 
GROUP BY DAYNAME(Departure),DAYOFWEEK(Departure)
ORDER BY DAYOFWEEK(Departure) ASC;



-- Q18. Make a weekday vs time grid showing avg flight price from Bangalore and Delhi?

-- THIS IS CORRECT 

SELECT DAYNAME(Departure),
AVG(CASE WHEN HOUR(Departure) BETWEEN 0 AND 5 THEN price ELSE NULL END) AS "12 AM - 6 AM",
AVG(CASE WHEN HOUR(Departure) BETWEEN 6 AND 11 THEN price ELSE NULL END) AS "6 AM - 12 PM",
AVG(CASE WHEN HOUR(Departure) BETWEEN 12 AND 17 THEN price ELSE NULL END) AS "12 PM - 6 PM",
AVG(CASE WHEN HOUR(Departure) BETWEEN 18 AND 23 THEN price ELSE NULL END) AS "6 PM - 12 PM"
FROM flights 
WHERE Source='Banglore' AND Destination='Delhi' 
GROUP BY DAYNAME(Departure),DAYOFWEEK(Departure)
ORDER BY DAYOFWEEK(Departure) ASC;

