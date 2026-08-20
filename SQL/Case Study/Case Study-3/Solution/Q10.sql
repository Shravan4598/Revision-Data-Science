
-- Q10. Find all flights which departed before midnight but arrived at their destination after midnight having only 0 stop.

SELECT * FROM flights;

SELECT DISTINCT(Total_Stops) FROM flights;

SELECT * FROM flights WHERE Total_Stops='non-stop';

SELECT * FROM flights WHERE Total_Stops='non-stop'
AND DATE(Departure) < DATE(arrival);

