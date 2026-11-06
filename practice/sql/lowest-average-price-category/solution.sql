SELECT 
    category,
    AVG(price) AS average_price
FROM products
GROUP BY category
ORDER BY average_price ASC
LIMIT 1;
