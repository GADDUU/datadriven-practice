SELECT
  token_id,
  scope
FROM api_tokens
ORDER BY SUBSTR(scope, 2, 1) ASC, issued
