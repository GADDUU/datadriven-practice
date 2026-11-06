SELECT
  endpoint,
  COUNT(call_id) AS total_calls,
  COUNT(call_id) FILTER(WHERE status BETWEEN 400 AND 599) AS error_calls,
  ROUND(
    CAST(COUNT(call_id) FILTER(WHERE status BETWEEN 400 AND 599) * 100 AS DOUBLE) / COUNT(call_id),
    2
  ) AS error_rate
FROM api_calls
GROUP BY endpoint
HAVING COUNT(call_id) >= 20
ORDER BY error_rate DESC
