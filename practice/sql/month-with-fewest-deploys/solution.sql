WITH CTE AS (
  SELECT
    EXTRACT(MONTH FROM deploy_at) AS month,
    COUNT(*) AS deploy_count
  FROM deploy_logs
  GROUP BY month
)
  
SELECT
  month,
  deploy_count
FROM CTE
WHERE deploy_count = (
  SELECT
    MIN(deploy_count)
  FROM CTE
)
ORDER BY month
LIMIT 1
