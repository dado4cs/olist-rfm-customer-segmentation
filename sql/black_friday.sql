WITH total AS (
WITH compras_black_friday AS (
SELECT 
customer_id,
order_id,
order_purchase_timestamp
FROM orders
WHERE order_purchase_timestamp::DATE IN (CAST('2017-11-24' AS DATE),CAST('2017-11-25' AS DATE),CAST('2017-11-26' AS DATE),CAST('2017-11-27' AS DATE)) AND order_status NOT IN ('canceled','unavailable')
)
SELECT 
c.customer_unique_id,
COUNT(*) as compras_black_friday
FROM customers c
JOIN compras_black_friday b ON b.customer_id = c.customer_id
GROUP BY c.customer_unique_id
)
SELECT 
c.customer_unique_id,
t.compras_black_friday,
c.frequency
FROM customer_rfm c
JOIN total t ON c.customer_unique_id = t.customer_unique_id