

-- Q15: find delivery partner compensation using the formula (#deliveries * 100 + 1000*avg_rating)?

SELECT t1.partner_id,t2.partner_name,
(COUNT(*)*100+SUM(delivery_rating)/COUNT(*)*1000) AS 'compensation'
FROM orders AS t1 
LEFT JOIN delivery_partner AS t2
ON t1.partner_id=t2.partner_id
GROUP BY t1.partner_id,t2.partner_name
ORDER BY t1.partner_id;