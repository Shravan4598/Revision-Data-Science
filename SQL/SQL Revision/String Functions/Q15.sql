

-- Q15. Consider the following SQL query: SELECT 'www.campusx.com', SUBSTRING_INDEX('www.campusx.com', '.', -2);
-- What will be the exact output of the SUBSTRING_INDEX part of this query?
-- A. www
-- B. www.campusx
-- C. campusx.
-- D. com


SELECT "www.campusx.com",SUBSTRING_INDEX("www.campusx.com",".",1); -- www.campusx.com	www

SELECT "www.campusx.com",SUBSTRING_INDEX("www.campusx.com",".",2); -- www.campusx.com	www.campusx

SELECT "www.campusx.com",SUBSTRING_INDEX("www.campusx.com",".",-1); -- www.campusx.com	com

SELECT "www.campusx.com",SUBSTRING_INDEX("www.campusx.com",".",-2); -- www.campusx.com	campusx.com

