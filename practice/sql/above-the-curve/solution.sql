WITH CTE1 AS (
  SELECT
    user_id,
    SUM(total_amount) AS total
  FROM transactions
  GROUP BY user_id
),
CTE2 AS (
  SELECT
    AVG(total) AS avg_total
  FROM CTE1
)

SELECT
  c1.user_id,
  c1.total,
  c1.total - c2.avg_total AS above_avg
FROM CTE1 AS c1
CROSS JOIN CTE2 AS c2
WHERE above_avg > 0
ORDER BY above_avg DESC
