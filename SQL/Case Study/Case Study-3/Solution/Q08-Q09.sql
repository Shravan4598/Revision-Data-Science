

-- Q08. Find the number of flights which travel on multiple dates.

SELECT * FROM flights;

SELECT Airline,departure,arrival FROM flights WHERE DATE(departure)=DATE(arrival);

SELECT Airline,departure,arrival FROM flights WHERE DATE(departure)!=DATE(arrival);
SELECT COUNT(*) FROM flights WHERE DATE(departure)!=DATE(arrival);


-- Q09. Calculate the average duration of flights between all city pairs?

SELECT Source,Destination,AVG(duration_min) FROM flights GROUP BY Source,Destination;

-- Q09. Calculate the average duration of flights between all city pairs? TIME format should be(Xh Y m).

SELECT Source,Destination,AVG(duration_min)*60 FROM flights GROUP BY Source,Destination;

SELECT Source,Destination,SEC_TO_TIME(AVG(duration_min)*60) FROM flights GROUP BY Source,Destination;

SELECT Source,Destination,TIME_FORMAT(SEC_TO_TIME(AVG(duration_min)*60),'%hh %im') FROM flights GROUP BY Source,Destination;

SELECT Source,Destination,TIME_FORMAT(SEC_TO_TIME(AVG(duration_min)*60),'%kh %im') AS "avg_duration"  FROM flights GROUP BY Source,Destination;

