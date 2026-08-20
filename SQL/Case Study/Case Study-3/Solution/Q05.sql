
-- Q05. Find the number of flights departing on weekends from Bangalore?

SELECT * FROM flights WHERE Source='Banglore';


SELECT DAYNAME(Date_of_Journey) AS 'Day' , COUNT(*) AS "Number_of_Flights" FROM flights 
WHERE Source='Banglore' AND (DAYNAME(Date_of_Journey)='Saturday' OR DAYNAME(Date_of_Journey)='Sunday')
GROUP BY DAYNAME(Date_of_Journey);

SELECT DAYNAME(Date_of_Journey) AS 'Day' , COUNT(*) AS "Number_of_Flights" FROM flights 
WHERE Source='Banglore' AND DAYNAME(Date_of_Journey) IN ('Saturday','Sunday')
GROUP BY DAYNAME(Date_of_Journey);

SELECT COUNT(*) AS "Number_of_Flights" FROM flights
WHERE Source='Banglore' AND DAYNAME(Date_of_Journey) IN ('Saturday','Sunday');

