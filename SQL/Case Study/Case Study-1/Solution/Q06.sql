
-- Q06: find restaurant with most number of menu items?

SELECT * FROM menu AS t1
LEFT JOIN restaurants AS t2
ON t1.r_id=t2.r_id;

SELECT r_name, COUNT(*) AS 'number_of_menu_items'
FROM menu AS t1
LEFT JOIN restaurants AS t2
ON t1.r_id=t2.r_id
GROUP BY r_name
ORDER BY number_of_menu_items DESC
LIMIT 1;