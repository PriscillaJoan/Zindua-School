-- Find the first order (by date) for each customer.

SELECT o.customer_id, c.first_name, c.last_name, MIN(o.order_date) AS first_order_date
FROM orders o
JOIN customer c ON o.customer_id = c.customer_id
GROUP BY o.customer_id, c.first_name, c.last_name
ORDER BY first_order_date;

-- total revenue for each product
SELECT p.product_id, p.product_name, SUM(oi.quantity * p.price) AS total_revenue
FROM product p
JOIN order_items oi ON p.product_id = oi.product_id
GROUP BY p.product_id, p.product_name
ORDER BY total_revenue DESC;

-- day with highest revenue
SELECT o.order_date, SUM(oi.quantity * p.price) AS total_revenue
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
JOIN product p ON oi.product_id = p.product_id
GROUP BY o.order_date
ORDER BY total_revenue DESC
LIMIT 1;



