SELECT
  p.category,
  SUM(p.price * t.quantity) AS total_revenue
FROM products AS p
INNER JOIN transactions AS t
  ON p.product_id = t.product_id
GROUP BY p.category
