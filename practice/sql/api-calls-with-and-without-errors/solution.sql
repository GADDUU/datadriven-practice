SELECT
  endpoint,
  COUNT(*) FILTER(WHERE err_msg IS NULL) AS no_error_count,
  COUNT(*) FILTER(WHERE err_msg IS NOT NULL) AS error_count,
  COUNT(*) AS total_count
FROM api_calls
GROUP BY endpoint
