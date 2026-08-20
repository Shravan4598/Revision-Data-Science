

-- Q06. Calculate the arrival time for all flights by adding the duration to the departure time?

ALTER TABLE flights ADD COLUMN Departure DATETIME;

SELECT * FROM flights;

SET SQL_SAFE_UPDATES = 0;

SELECT STR_TO_DATE(CONCAT(Date_of_Journey," ",Dep_Time),'%Y-%m-%d %H:%i') FROM flights;

UPDATE flights SET Departure=STR_TO_DATE(CONCAT(Date_of_Journey," ",Dep_Time),'%Y-%m-%d %H:%i');

SELECT Duration, SUBSTRING_INDEX(Duration," ",1) as "hrs",
CASE WHEN SUBSTRING_INDEX(Duration," ",1)=SUBSTRING_INDEX(Duration," ",-1) THEN 0
	ELSE SUBSTRING_INDEX(Duration," ",-1) 
    END AS "minute"
FROM flights;

SELECT Duration, REPLACE(SUBSTRING_INDEX(Duration," ",1),"h","") as "hrs",
CASE WHEN SUBSTRING_INDEX(Duration," ",1)=SUBSTRING_INDEX(Duration," ",-1) THEN 0
	ELSE REPLACE(SUBSTRING_INDEX(Duration," ",-1),"m","")
    END AS "minute"
FROM flights;

SELECT Duration, REPLACE(SUBSTRING_INDEX(Duration," ",1),"h","")*60 as "hrs",
CASE WHEN SUBSTRING_INDEX(Duration," ",1)=SUBSTRING_INDEX(Duration," ",-1) THEN 0
	ELSE REPLACE(SUBSTRING_INDEX(Duration," ",-1),"m","")
    END AS "minute"
FROM flights;

SELECT Duration, REPLACE(SUBSTRING_INDEX(Duration," ",1),"h","")*60  +
CASE WHEN SUBSTRING_INDEX(Duration," ",1)=SUBSTRING_INDEX(Duration," ",-1) THEN 0
	ELSE REPLACE(SUBSTRING_INDEX(Duration," ",-1),"m","")
    END AS "minute"
FROM flights;

ALTER TABLE flights ADD COLUMN duration_min INTEGER,
ADD COLUMN arrival DATETIME;

UPDATE flights SET duration_min=REPLACE(SUBSTRING_INDEX(Duration," ",1),"h","")*60  +
CASE WHEN SUBSTRING_INDEX(Duration," ",1)=SUBSTRING_INDEX(Duration," ",-1) THEN 0
	ELSE REPLACE(SUBSTRING_INDEX(Duration," ",-1),"m","")
    END;

UPDATE flights
SET duration_min =
    CASE
        WHEN Duration LIKE '%h%' THEN
            REPLACE(SUBSTRING_INDEX(Duration, ' ', 1), 'h', '') * 60
            +
            CASE
                WHEN SUBSTRING_INDEX(Duration, ' ', 1) = SUBSTRING_INDEX(Duration, ' ', -1)
                THEN 0
                ELSE REPLACE(SUBSTRING_INDEX(Duration, ' ', -1), 'm', '')
            END
        ELSE
            REPLACE(Duration, 'm', '')
    END;
    
SELECT * FROM flights;

SELECT Departure,duration_min,DATE_ADD(Departure,INTERVAL duration_min MINUTE) FROM flights;

UPDATE flights SET arrival=DATE_ADD(Departure,INTERVAL duration_min MINUTE);

-- Q06. Calculate the arrival time for all flights by adding the duration to the departure time.

SELECT Airline,Source,Destination,Date_of_Journey,
Dep_Time,DATE(arrival) AS "arrival_date",TIME(arrival) AS "arrival_time",Price FROM flights;


