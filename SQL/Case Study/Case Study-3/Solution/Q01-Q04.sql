CREATE DATABASE flight;
USE flight;

SELECT * FROM flights;

-- Q01. Find the month with most number of flights.

SELECT MONTHNAME(Date_of_Journey),COUNT(*) AS 'number of flights' FROM flights GROUP BY MONTHNAME(Date_of_Journey);

SELECT MONTHNAME(Date_of_Journey),COUNT(*) AS 'number of flights' 
FROM flights GROUP BY MONTHNAME(Date_of_Journey) ORDER BY `number of flights` DESC;

SELECT MONTHNAME(Date_of_Journey),COUNT(*) AS 'number of flights' 
FROM flights GROUP BY MONTHNAME(Date_of_Journey) ORDER BY `number of flights` DESC LIMIT 1;

-- Q02. Which week day has most costly flights.

SELECT DISTINCT(YEAR(Date_of_Journey)) FROM flights;

SELECT DAYNAME(Date_of_Journey),SUM(Price) FROM FLIGHTS GROUP BY DAYNAME(Date_of_Journey) ORDER BY SUM(Price) DESC;
SELECT DAYNAME(Date_of_Journey),SUM(Price) FROM FLIGHTS GROUP BY DAYNAME(Date_of_Journey) ORDER BY SUM(Price) DESC LIMIT 1;
SELECT DAYNAME(Date_of_Journey),AVG(Price) FROM FLIGHTS GROUP BY DAYNAME(Date_of_Journey) ORDER BY AVG(Price) DESC LIMIT 1;


-- Q03. Find number of indigo flights every month.

SELECT * FROM flights WHERE Airline='IndiGo';

SELECT MONTHNAME(Date_of_Journey) AS "Month", COUNT(*) AS "Number of indigo flight per month" 
FROM flights WHERE Airline='IndiGo' GROUP BY MONTHNAME(Date_of_Journey);

-- Q04. Find list of all flights that depart between 10AM and 2PM from Bangalore to Delhi.

SELECT * FROM flights WHERE Source='Banglore' AND Destination='Delhi';

SELECT * FROM flights WHERE Source='Banglore' AND Destination='Delhi' AND Dep_Time>'10:00:00' AND Dep_Time<'14:00:00';
