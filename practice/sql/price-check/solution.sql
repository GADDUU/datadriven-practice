SELECT
  category,
  COUNT(*) AS unpriced_products,
  AVG(rating) AS avg_rating
FROM products
WHERE price IS NULL
GROUP BY category
HAVING COUNT(*) <> 0
ORDER BY avg_rating DESC
