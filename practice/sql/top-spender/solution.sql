WITH customer_spending AS (
  SELECT
    t.user_id,
    SUM(t.total_amount) AS total_spending
  FROM transactions AS t
  JOIN products AS p
    ON t.product_id = p.product_id
  WHERE p.rating >= 4.0
  GROUP BY t.user_id
),
largest_order AS (
  SELECT
    MAX(total_amount) AS max_order_amount
  FROM transactions
)

SELECT
  u.username,
  cs.total_spending
FROM customer_spending AS cs
JOIN users AS u
  ON cs.user_id = u.user_id
CROSS JOIN largest_order AS lo
WHERE cs.total_spending > lo.max_order_amount
ORDER BY cs.total_spending DESC
