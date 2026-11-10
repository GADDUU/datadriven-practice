SELECT
  COUNT(*) AS unused_read_tokens
FROM api_tokens
WHERE requests = 0
  AND scope = 'read'
