SELECT
  product_id,
  SUM(quantity) AS total_quantity
FROM transactions
WHERE EXTRACT(YEAR FROM transaction_date) = 2026
GROUP BY product_id
ORDER BY total_quantity DESC
