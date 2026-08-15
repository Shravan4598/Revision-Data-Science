

-- Q14. Remove unwanted things from the string?
-- Example: 
-- "    Shravan      " --> "Shravan"
-- "......Shravan........" ---> "Shravan"

SELECT TRIM("    Shravan      "); -- Shravan

SELECT TRIM(BOTH "." FROM "......Shravan........"); -- Shravan


SELECT TRIM(LEADING "." FROM "......Shravan........"); -- Shravan........

SELECT TRIM(TRAILING "." FROM "......Shravan........"); -- ......Shravan


SELECT TRIM(BOTH "." FROM "......Shra.van........"); -- Shra.van


SELECT TRIM(LEADING "." FROM "......Shra.van........"); -- Shra.van........

SELECT TRIM(TRAILING "." FROM "......Shra.van........"); -- ......Shra.van

-- LTRIM AND RTRIM trim only spaces

SELECT LTRIM("    Shravan      ");
SELECT LENGTH(LTRIM("    Shravan      ")); -- 13



SELECT RTRIM("          Shravan      ");



