USE abc_data;
SELECT product_name,product_id,price 
FROM product
WHERE price = (SELECT max(price) FROM product);

-- which order ID has the highest number of items in turns of quantity
SELECT order_id, SUM(quantity) AS total_items
FROM order_items
GROUP BY order_id
ORDER BY total_items DESC
LIMIT 1;
