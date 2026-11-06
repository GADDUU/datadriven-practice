SELECT
  p.category,
  COUNT(DISTINCT t.product_id) AS products_sold,
  SUM(t.total_amount) AS total_revenue
FROM products AS p
INNER JOIN transactions AS t
  ON p.product_id = t.product_id
WHERE p.in_stock <> 0
GROUP BY p.category
ORDER BY total_revenue DESC
