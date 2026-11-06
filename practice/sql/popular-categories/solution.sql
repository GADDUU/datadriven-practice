SELECT
  category,
  COUNT(product_id) AS product_count,
  AVG(rating) AS avg_rating,
  AVG(price) AS avg_price
FROM products
WHERE rating >= 3
GROUP BY category
HAVING COUNT(product_id) FILTER(WHERE rating >= 3) > 8
