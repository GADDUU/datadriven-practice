WITH CTE AS (
  SELECT
    endpoint,
    COUNT(*) AS call_count,
    AVG(latency) AS avg_latency
  FROM api_calls
  GROUP BY endpoint
)
  
SELECT
  *,
  DENSE_RANK() OVER(ORDER BY avg_latency DESC) AS position
FROM CTE
