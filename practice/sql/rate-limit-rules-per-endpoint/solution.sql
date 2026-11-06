WITH allowed_range AS (
  SELECT
    endpoint,
    MIN(allowed) AS min_allowed,
    MAX(allowed) AS max_allowed
  FROM rate_limits
  GROUP BY endpoint
)
  
SELECT
  *,
  'Allowed > ' || min_allowed || ' AND Allowed <= ' || max_allowed || ' => Endpoint = ' || endpoint
FROM allowed_range
