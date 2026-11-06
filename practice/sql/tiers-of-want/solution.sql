WITH user_category_metrics AS (
  SELECT
    t.user_id,
    p.category,
    SUM(t.total_amount) AS total_spend,
    COUNT(t.transaction_id) AS total_transactions,
    SUM(t.total_amount) / COUNT(t.transaction_id) AS avg_basket_size
  FROM transactions AS t
  JOIN products AS p
    ON t.product_id = p.product_id
  GROUP BY t.user_id, p.category
),
user_segments AS (
  SELECT
    user_id,
    category,
    total_spend,
    total_transactions,
    avg_basket_size,
    CASE
      WHEN avg_basket_size > 500 THEN 'High'
      WHEN avg_basket_size >= 200 THEN 'Medium'
      ELSE 'Low'
    END AS segment
  FROM user_category_metrics
)

SELECT
  category,
  segment,
  COUNT(DISTINCT user_id) AS unique_users,
  SUM(total_transactions) AS total_transactions,
  ROUND(SUM(total_spend), 3) AS total_sales,
  ROUND(AVG(avg_basket_size), 3) AS avg_basket_size
FROM user_segments
GROUP BY category, segment
ORDER BY category, segment
