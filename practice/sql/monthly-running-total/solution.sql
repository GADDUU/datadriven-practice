WITH monthly_revenue AS (
  SELECT
    product_id,
    TO_CHAR(transaction_date, 'YYYY-MM') AS month,
    SUM(total_amount) AS monthly_total
  FROM transactions 
  WHERE product_id IS NOT NULL
  GROUP BY product_id, month
  ORDER BY product_id, month
)
  
SELECT
  *,
  SUM(monthly_total) OVER(PARTITION BY product_id ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS cumulative_total
FROM monthly_revenue
