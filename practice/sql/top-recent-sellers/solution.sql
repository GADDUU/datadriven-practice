SELECT
  product_id,
  SUM(total_amount) AS total_sales
FROM transactions
WHERE transaction_date >= CURRENT_DATE - INTERVAL '30 days'
GROUP BY product_id
ORDER BY total_sales DESC
LIMIT 3
