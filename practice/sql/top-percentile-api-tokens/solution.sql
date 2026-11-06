WITH ranked_request AS (
  SELECT
    token_id,
    scope,
    requests,
    PERCENT_RANK() OVER (
      PARTITION BY scope
      ORDER BY requests
    ) AS rnk
  FROM api_tokens
)

SELECT
  token_id,
  scope,
  requests,
  ROUND(rnk, 2) AS percentile_rank
FROM ranked_request
WHERE ROUND(rnk, 2) > 0.95
ORDER BY scope, requests DESC, token_id
