SELECT
  category,
  AVG(rating) AS avg_rating
FROM products
GROUP BY category
ORDER BY avg_rating DESC
