

-- Q09: find restaurant with max revenue in a given month

SELECT t2.r_id,t2.r_name,SUM(t1.amount) AS 'revenue' FROM
orders AS t1 RIGHT JOIN 
restaurants AS t2
ON t1.r_id=t2.r_id
GROUP BY t2.r_name,t2.r_id;


SELECT t2.r_id,t2.r_name,SUM(t1.amount) AS 'revenue' FROM
orders AS t1 RIGHT JOIN 
restaurants AS t2
ON t1.r_id=t2.r_id
GROUP BY t2.r_name,t2.r_id
ORDER BY revenue DESC
LIMIT 1;

SELECT date FROM orders;
SELECT DATE(date) FROM orders;
SELECT MONTH(DATE(date)) FROM orders;
SELECT MONTHNAME(DATE(date)) FROM orders;

-- I want the name of restaurants have maximum revenue in a MAY month


SELECT t2.r_id,t2.r_name,SUM(t1.amount) AS 'revenue'
FROM orders AS t1 RIGHT JOIN restaurants AS t2
ON t1.r_id=t2.r_id
WHERE MONTHNAME(DATE(t1.date)) ='May'
GROUP BY t2.r_id,t2.r_name;

SELECT t2.r_id,t2.r_name,SUM(t1.amount) AS 'revenue'
FROM orders AS t1 RIGHT JOIN restaurants AS t2
ON t1.r_id=t2.r_id
WHERE MONTHNAME(DATE(t1.date)) ='May'
GROUP BY t2.r_id,t2.r_name
ORDER BY revenue DESC
LIMIT 1;

