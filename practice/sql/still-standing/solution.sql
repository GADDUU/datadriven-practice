SELECT
  token_id,
  issued,
  SUM(requests) AS requests
FROM api_tokens
WHERE expires IS NULL OR expires > DATE('NOW')
GROUP BY token_id
ORDER BY requests DESC
LIMIT 20
