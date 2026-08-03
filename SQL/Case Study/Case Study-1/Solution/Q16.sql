

-- Q16: find revenue per month for a restaurant

SELECT t1.r_id,t1.r_name,t2.amount,t2.date  FROM restaurants AS t1
RIGHT JOIN orders AS t2 ON 
t1.r_id=t2.r_id;

SELECT t1.r_id,t1.r_name,
MONTHNAME(DATE(t2.date))  AS 'month',
SUM(t2.amount) AS 'revenue_per_month'
FROM restaurants AS t1
RIGHT JOIN orders AS t2 ON 
t1.r_id=t2.r_id
GROUP BY t1.r_id,t1.r_name,MONTHNAME(DATE(t2.date))
ORDER BY t1.r_name;