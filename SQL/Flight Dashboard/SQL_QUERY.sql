SELECT * FROM flights.flights_data;

USE flights;

SELECT DISTINCT(Source) FROM flights.flights_data
                                 UNION
                                 SELECT DISTINCT(Destination) FROM flights.flights_data;
                                 
SELECT Airline,Date_of_Journey,Route,Dep_Time,Price FROM flights.flights_data WHERE Source='Banglore' AND Destination='Delhi';

SELECT Source FROM flights.flights_data;
SELECT Destination FROM flights.flights_data;

SELECT Source FROM flights.flights_data
UNION ALL
SELECT Destination FROM flights.flights_data;

SELECT Source,COUNT(*) AS 'count' FROM (SELECT Source FROM flights.flights_data
UNION ALL
SELECT Destination FROM flights.flights_data) t
GROUP BY Source
ORDER BY count DESC;

SELECT Date_of_Journey,COUNT(*) FROM flights.flights_data GROUP BY Date_of_Journey;