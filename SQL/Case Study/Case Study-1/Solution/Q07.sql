

-- Q07: find number of votes and avg rating for all the restaurants

SELECT * FROM orders AS t1
JOIN restaurants AS t2
ON t1.r_id=t2.r_id
WHERE restaurant_rating IS NOT NULL;

SELECT t2.r_id,t2.r_name,COUNT(*) AS 'number_of_votes',
AVG(t1.delivery_rating) AS 'avg_delivery_rating',
AVG(t1.restaurant_rating) AS 'avg_restaurant_rating'
FROM orders AS t1
JOIN restaurants AS t2
ON t1.r_id=t2.r_id
WHERE restaurant_rating IS NOT NULL
GROUP BY t2.r_id,t2.r_name;

