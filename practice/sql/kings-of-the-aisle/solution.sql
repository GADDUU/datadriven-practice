WITH ranked AS (
  SELECT
    p.category AS category,
    p.product_name AS product_name,
    SUM(t.total_amount) AS total_revenue,
    ROW_NUMBER() OVER(PARTITION BY p.category ORDER BY SUM(t.total_amount) DESC) AS rnk
  FROM transactions AS t
  INNER JOIN products AS p
    ON t.product_id = p.product_id
  WHERE EXTRACT(YEAR FROM t.transaction_date) = 2026
  GROUP BY p.category, p.product_name
)
  
SELECT
  category,
  product_name,
  total_revenue
FROM ranked
WHERE rnk = 1
ORDER BY total_revenue DESC
