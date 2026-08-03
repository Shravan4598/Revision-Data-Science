 
 
 -- Q9.1 I WANT THE REVENUE OF ALL RESTAURANTS ON EVERY MONTH?
 
SELECT MONTH(DATE(t1.date)) AS month_no,
MONTHNAME(DATE(t1.date)) AS month,t2.r_name,SUM(t1.amount) AS 'revenue'
FROM orders AS t1 RIGHT JOIN restaurants AS t2 ON t1.r_id=t2.r_id
GROUP BY MONTH(DATE(t1.date)),MONTHNAME(DATE(t1.date)),t2.r_name
ORDER BY month_no;
 