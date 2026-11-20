WITH ranked_latency AS (
  SELECT
    endpoint,
    latency,
    ROW_NUMBER() OVER(PARTITION BY endpoint ORDER BY latency DESC) AS rnk
  FROM api_calls
  WHERE EXTRACT(YEAR FROM call_time) = 2026
),
filtered_latency AS (
  SELECT
    endpoint,
    latency AS max_latency
  FROM ranked_latency
  WHERE rnk = 1
)
  
SELECT
  *
FROM (
  SELECT
    endpoint,
    max_latency,
    DENSE_RANK() OVER(ORDER BY max_latency DESC) AS rnk
  FROM filtered_latency
)
WHERE rnk <= 10
