SELECT
  p.product_name,
  SUM(t.total_amount) AS total_revenue,
  SUM(t.quantity) AS units_sold
FROM products AS p
INNER JOIN transactions AS t
  ON p.product_id = t.product_id
GROUP BY p.product_name
HAVING SUM(t.total_amount) >= 100
ORDER BY total_revenue DESC
