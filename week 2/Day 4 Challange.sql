use abc_data;
-- which customer has the highest order

SELECT c.customer_id, c.first_name, c.last_name, COUNT(o.order_id) AS total_orders
FROM customer c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id
ORDER BY total_orders DESC
LIMIT 1;

-- total revenue per product
SELECT p.product_id, p.product_name, SUM(oi.quantity * p.price) AS total_revenue
FROM product p
JOIN order_items oi ON p.product_id = oi.product_id
GROUP BY p.product_id, p.product_name
ORDER BY total_revenue DESC;
