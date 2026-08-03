USE zomato;

-- Q04: Find null values?

SELECT * FROM orders;
SELECT * FROM orders WHERE restaurant_rating IS NULL;


-- To replace the value of null values

UPDATE orders SET  restaurant_rating =0 WHERE restaurant_rating=NULL;

