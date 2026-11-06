SELECT
  p.product_name,
  SUM(t.total_amount) AS total_revenue
FROM products AS p
INNER JOIN transactions AS t
  ON p.product_id = t.product_id
GROUP BY p.product_name
ORDER BY SUM(t.total_amount) DESC
LIMIT 5
