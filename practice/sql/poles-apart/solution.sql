SELECT
  token_id,
  scope,
  requests
FROM api_tokens
WHERE requests IN (
    SELECT
      MAX(requests)
    FROM api_tokens
    WHERE requests <> 0
  
    UNION ALL
  
    SELECT
      MIN(requests)
    FROM api_tokens
    WHERE requests <> 0
  )
  OR (
    requests = 0
    AND scope = 'admin'
  )
ORDER BY requests DESC
