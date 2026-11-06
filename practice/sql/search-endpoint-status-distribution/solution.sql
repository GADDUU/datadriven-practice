SELECT
  status,
  COUNT(*) AS call_count
FROM api_calls
WHERE endpoint = '/api/v1/search'
GROUP BY status
ORDER BY status
