

-- Q07. Calculate the arrival date for all the flights?

SELECT * FROM flights;

SELECT Airline,Source,Destination,Date_of_Journey,DATE(arrival) AS "arrival_date" FROM flights;

