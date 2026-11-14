SELECT
  p.category,
  COUNT(DISTINCT t.user_id) AS unique_buyers,
  SUM(t.total_amount) AS total_revenue
FROM products AS p
INNER JOIN transactions AS t
  ON p.product_id = t.product_id
GROUP BY p.category
HAVING COUNT(DISTINCT t.user_id) = 3
ORDER BY total_revenue DESC
