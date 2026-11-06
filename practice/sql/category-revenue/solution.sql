SELECT
  p.category,
  SUM(t.total_amount) AS total_revenue,
  COUNT(*) AS transactions_count,
  SUM(t.total_amount) / COUNT(*) AS avg_transaction_size
FROM products AS p
INNER JOIN transactions AS t
  ON p.product_id = t.product_id
GROUP BY p.category
HAVING SUM(t.total_amount) > 12100
ORDER BY total_revenue DESC
