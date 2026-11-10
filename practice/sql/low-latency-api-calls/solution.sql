SELECT
  *
FROM api_calls
WHERE latency IS NOT NULL
  AND latency < 100
ORDER BY latency ASC, call_id ASC
