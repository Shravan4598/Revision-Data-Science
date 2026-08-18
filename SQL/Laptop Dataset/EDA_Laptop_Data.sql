
USE laptop_data;

SELECT * FROM laptopdata;


ALTER TABLE laptopdata
ADD COLUMN laptop_id INT AUTO_INCREMENT PRIMARY KEY FIRST;

-- HEAD

SELECT * FROM laptopdata LIMIT 5;

-- TAIL
SELECT * FROM laptopdata ORDER BY laptop_id DESC LIMIT 5;

-- SAMPLE
SELECT * FROM laptopdata ORDER BY RAND() LIMIT 5;

-- UNIVARIATE ANALYSIS

-- Numerical Column

-- Price
SELECT
    COUNT(Price) AS `Count`,
    MIN(Price) AS `Min`,
    MAX(Price) AS `Max`,
    AVG(Price) AS `Mean`,
    STD(Price) AS `Std`
FROM laptopdata;

WITH ranked AS (
    SELECT
        Price,
        PERCENT_RANK() OVER (ORDER BY Price) AS p
    FROM laptopdata
    WHERE Price IS NOT NULL
)
SELECT
    MIN(CASE WHEN p >= 0.25 THEN Price END) AS Q1,
    MIN(CASE WHEN p >= 0.50 THEN Price END) AS Median,
    MIN(CASE WHEN p >= 0.75 THEN Price END) AS Q3
FROM ranked;

-- Missing Value

SELECT COUNT(Price) FROM laptopdata WHERE Price IS NULL; -- 0

-- OUTLIERS
-- IQR = Q3 - Q1
-- Lower Limit = Q1 - 1.5 × IQR
-- Upper Limit = Q3 + 1.5 × IQR

WITH ranked AS (
    SELECT
        Price,
        ROW_NUMBER() OVER (ORDER BY Price) AS rn,
        COUNT(*) OVER () AS n
    FROM laptopdata
    WHERE Price IS NOT NULL
),
quartiles AS (
    SELECT
        MAX(CASE WHEN rn = CEIL((n + 1) * 0.25) THEN Price END) AS Q1,
        MAX(CASE WHEN rn = CEIL((n + 1) * 0.75) THEN Price END) AS Q3
    FROM ranked
)
SELECT l.*
FROM laptopdata l
CROSS JOIN quartiles q
WHERE l.Price < q.Q1 - 1.5 * (q.Q3 - q.Q1)
   OR l.Price > q.Q3 + 1.5 * (q.Q3 - q.Q1);
   

-- Histogram

SELECT price FROM laptopdata;

SELECT price,
CASE WHEN price BETWEEN 0 AND 25000 THEN "0-25K"
 WHEN price BETWEEN 25000 AND 50000 THEN "25K-50K"
 WHEN price BETWEEN 50000 AND 75000 THEN "50K-75K"
 WHEN price BETWEEN 75000 AND 100000 THEN "75K-100K"
 ELSE ">100K"
END AS "buckets"
FROM laptopdata;

SELECT t.buckets,COUNT(*) FROM  (SELECT 
CASE WHEN price BETWEEN 0 AND 25000 THEN "0-25K"
 WHEN price BETWEEN 25000 AND 50000 THEN "25K-50K"
 WHEN price BETWEEN 50000 AND 75000 THEN "50K-75K"
 WHEN price BETWEEN 75000 AND 100000 THEN "75K-100K"
 ELSE ">100K"
END AS "buckets"
FROM laptopdata) t
GROUP BY t.buckets;

SELECT t.buckets,REPEAT("*",COUNT(*)/5) AS 'Histogram' FROM  (SELECT 
CASE WHEN price BETWEEN 0 AND 25000 THEN "0-25K"
 WHEN price BETWEEN 25000 AND 50000 THEN "25K-50K"
 WHEN price BETWEEN 50000 AND 75000 THEN "50K-75K"
 WHEN price BETWEEN 75000 AND 100000 THEN "75K-100K"
 ELSE ">100K"
END AS "buckets"
FROM laptopdata) t
GROUP BY t.buckets;

-- Categorical Column
-- Company

-- Value Counts
SELECT Company,COUNT(*) AS "Value_Count"  FROM laptopdata GROUP BY Company;

SELECT 
    Company,
    SUM(CASE 
            WHEN touch_screen = 1 THEN 1 
            ELSE 0 
        END) AS 'Touchscreen_yes',
        
    SUM(CASE 
            WHEN touch_screen = 0 THEN 1 
            ELSE 0 
        END) AS 'Touchscreen_no'


-- contingency table
FROM laptopdata
GROUP BY Company;


-- Bivariate Analysis

-- Company Vs Price

SELECT Company,Price FROM laptopdata;

SELECT Company, COUNT(*),MIN(Price),
MAX(Price),AVG(Price),STD(Price)
FROM laptopdata GROUP BY Company;

-- Feature Engineering 

SELECT ppi FROM laptopdata ORDER BY ppi DESC;


ALTER TABLE laptopdata ADD COLUMN ppi INTEGER;

SET SQL_SAFE_UPDATES = 0;

UPDATE laptopdata SET ppi= ROUND(SQRT(height*height + width*width)/Inches);

-- One Hot Encoding

SELECT DISTINCT(CPU_Brand_Name) FROM laptopdata;

SELECT DISTINCT(gpu_brand) FROM laptopdata;

SELECT gpu_brand,
CASE WHEN gpu_brand="Intel" THEN 1 ELSE 0 END AS "Intel",
CASE WHEN gpu_brand="AMD" THEN 1 ELSE 0 END AS "AMD",
CASE WHEN gpu_brand="Nvidia" THEN 1 ELSE 0 END AS "Nvidia",
CASE WHEN gpu_brand="ARM" THEN 1 ELSE 0 END AS "ARM"
FROM laptopdata;


