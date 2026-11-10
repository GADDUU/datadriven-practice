SELECT
  COUNT(*) AS success_count
FROM api_calls
WHERE endpoint = '/api/v1/orders'
  AND status = 200
