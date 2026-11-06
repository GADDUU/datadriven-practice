SELECT
  category,
  COUNT(product_id) FILTER(WHERE rating >= 4) AS product_count
FROM products
GROUP BY category
HAVING COUNT(product_id) FILTER(WHERE rating >= 4) > 4
ORDER BY product_count DESC
