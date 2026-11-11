SELECT
  COUNT(*) AS endpoint_count
FROM (
  SELECT
    endpoint,
    COUNT(*) AS call_count
  FROM api_calls
  WHERE TO_CHAR(call_time, 'YYYY-MM') = '2026-02'
  GROUP BY endpoint
  HAVING COUNT(*) >= 80
)
