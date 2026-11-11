WITH ranked_last_used AS (
  SELECT
    *,
    ROW_NUMBER() OVER(PARTITION BY owner_id ORDER BY last_used DESC) AS rnk
  FROM api_tokens
)
  
SELECT
  *
FROM ranked_last_used
WHERE rnk = 1
