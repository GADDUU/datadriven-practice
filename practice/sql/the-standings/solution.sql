SELECT
  p.category AS category,
  SUM(t.total_amount) AS total_revenue,
  SUM(t.quantity) AS total_units,
  RANK() OVER(ORDER BY SUM(t.quantity) DESC) AS position
FROM products AS p
INNER JOIN transactions AS t
  ON p.product_id = t.product_id
GROUP BY p.category
--ORDER BY total_units DESC
