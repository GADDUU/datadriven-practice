SELECT
  p.category,
  AVG(p.rating) AS avg_rating,
  SUM(t.total_amount) AS total_revenue
FROM products AS p
INNER JOIN transactions AS t
  ON p.product_id = t.product_id
WHERE rating IS NOT NULL
GROUP BY p.category
ORDER BY p.category
