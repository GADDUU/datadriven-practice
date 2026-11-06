SELECT
  category,
  COUNT(rating) AS rated_products,
  ROUND(AVG(rating), 1) AS avg_rating
FROM products
GROUP BY category
HAVING COUNT(rating) >= 3
