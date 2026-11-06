WITH owner_totals AS (
  SELECT
    owner_id,
    SUM(requests) AS total_requests
  FROM api_tokens
  GROUP BY owner_id
),
top_owners AS (
  SELECT
    owner_id
  FROM owner_totals
  WHERE total_requests = (
    SELECT
      MAX(total_requests)
    FROM owner_totals
  )
),
all_scopes AS (
  SELECT DISTINCT
    scope
  FROM api_tokens
  WHERE scope IS NOT NULL
),
top_owner_scopes AS (
  SELECT DISTINCT
    t.scope
  FROM api_tokens AS t
  JOIN top_owners AS o
    ON t.owner_id = o.owner_id
  WHERE t.scope IS NOT NULL
)

SELECT
  a.scope
FROM all_scopes AS a
WHERE NOT EXISTS (
  SELECT
    1
  FROM top_owner_scopes AS ts
  WHERE ts.scope = a.scope
)
ORDER BY a.scope
