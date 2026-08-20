

-- Q14. Find all flights in a given date range originating from Delhi?
-- 1 JMAR 2019 TO 10 MAR 2019

SELECT * FROM flights;

SELECT Airline,Date_of_Journey,Source FROM flights WHERE Source='Delhi';

SELECT Airline,Date_of_Journey FROM flights WHERE Source='Delhi' AND Date_of_Journey BETWEEN "2019-03-01" AND "2019-03-10";

--  Q15. Find the longest flight of each airline?

SELECT Airline,TIME_FORMAT(SEC_TO_TIME(MAX(duration_min)*60),"%kh %im") FROM flights GROUP BY Airline ORDER BY MAX(duration_min)  DESC; 


-- Q16. Find all the pair of cities having average time duration > 3 hours?
-- 3hours= 180 minutes

SELECT * FROM flights;

SELECT Source,Destination,duration_min FROM flights WHERE duration_min>180;



