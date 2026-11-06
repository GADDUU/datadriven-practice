WITH CTE AS (
  SELECT
    CASE 
      WHEN TRIM(endpoint) LIKE '%/' THEN SUBSTR(TRIM(endpoint), 1, LENGTH(TRIM(endpoint)) - 1)
      ELSE TRIM(endpoint)
    END AS endpoint,
    latency
  FROM api_calls
)
  
SELECT
  endpoint,
  COUNT(*) AS total_calls,
  ROUND(AVG(latency), 2) AS avg_latency,
  COUNT(*) FILTER(WHERE latency > 500) AS high_latency_count
FROM CTE
GROUP BY endpoint
HAVING COUNT(*) >= 80
