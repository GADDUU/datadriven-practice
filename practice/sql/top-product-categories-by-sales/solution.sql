SELECT
  p.category,
  SUM(t.total_amount) AS total_revenue
FROM products AS p
INNER JOIN transactions AS t
  ON p.product_id = t.product_id
GROUP BY p.category
ORDER BY total_revenue DESC
