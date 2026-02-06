-- Fecha de referencia: 2018-09-03

-- Recency: 
-- Columna de fecha: order_purchase_timestamp

CREATE OR REPLACE VIEW customer_recency AS
SELECT 
    c.customer_unique_id,
    CAST('2018-09-03' AS DATE) - MAX(o.order_purchase_timestamp)::DATE AS recency
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id 
WHERE o.order_status NOT IN ('canceled','unavailable')
GROUP BY c.customer_unique_id;


CREATE OR REPLACE VIEW customer_frequency AS
SELECT 
    c.customer_unique_id,
COUNT(DISTINCT o.order_id) as frequency 
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id 
WHERE o.order_status NOT IN ('canceled','unavailable') AND AND o.order_purchase_timestamp::DATE <= '2018-09-03'
GROUP BY c.customer_unique_id;


CREATE OR REPLACE VIEW customer_monetary AS
SELECT 
    c.customer_unique_id,
    SUM(p.payment_value) AS monetary
FROM orders o
JOIN order_payments p ON o.order_id = p.order_id
JOIN customers c ON o.customer_id = c.customer_id
WHERE p.payment_value > 0 AND o.order_status NOT IN ('canceled','unavailable')
GROUP BY c.customer_unique_id;


CREATE OR REPLACE VIEW customer_rfm AS
SELECT 
r.customer_unique_id,
r.recency,
f.frequency,
m.monetary
FROM customer_recency r
LEFT JOIN customer_frequency f ON r.customer_unique_id = f.customer_unique_id
LEFT JOIN customer_monetary m ON r.customer_unique_id = m.customer_unique_id