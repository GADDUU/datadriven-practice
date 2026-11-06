WITH cnt AS (
  SELECT
    endpoint,
    COUNT(*) AS call_count
  FROM api_calls
  WHERE LOWER(method) = 'post' 
  GROUP BY endpoint
  ORDER BY call_count ASC
)
  
SELECT
  *,
  RANK() OVER(ORDER BY call_count) AS rnk
FROM cnt
LIMIT 4
