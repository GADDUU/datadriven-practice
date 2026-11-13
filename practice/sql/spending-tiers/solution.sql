WITH user_spend AS (
  SELECT
    user_id,
    AVG(total_amount) AS avg_spend
  FROM transactions GROUP BY user_id
),
overall_avg AS (
  SELECT
    AVG(total_amount) AS avg_spend
  FROM transactions
)
  
SELECT
  us.user_id,
  CASE 
    WHEN us.avg_spend > oa.avg_spend * 1.05 THEN 'high'
    WHEN us.avg_spend < oa.avg_spend * 0.95 THEN 'low'
    ELSE 'medium'
  END AS tier
FROM user_spend AS us
CROSS JOIN overall_avg AS oa
ORDER BY us.user_id
