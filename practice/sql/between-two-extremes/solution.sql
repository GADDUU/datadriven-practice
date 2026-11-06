WITH target_range AS (
  SELECT
    latency,
    MIN(latency) OVER() AS min_latency,
    MAX(latency) OVER() AS max_latency
  FROM api_calls
)
  
SELECT
  min_latency,
  max_latency,
  SUM(latency) FILTER (
    WHERE latency > min_latency
      AND latency < max_latency
  ) AS sum_between
FROM target_range
