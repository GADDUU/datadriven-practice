WITH all_endpoints AS (
  SELECT endpoint FROM api_calls
  UNION
  SELECT endpoint FROM rate_limits
),
normalized AS (
  SELECT
    CASE
      WHEN SUBSTR(TRIM(endpoint), -1) = '/'
        THEN SUBSTR(TRIM(endpoint), 1, LENGTH(TRIM(endpoint)) - 1)
      ELSE TRIM(endpoint)
    END AS endpoint
  FROM all_endpoints
),
catalog AS (
  SELECT
    CASE
      WHEN endpoint = '/api/v1/auth'
        OR endpoint LIKE '/api/v1/auth/%'
        THEN '/api/v1/auth'
      ELSE endpoint
    END AS endpoint
  FROM normalized
)
SELECT DISTINCT endpoint
FROM catalog
ORDER BY endpoint;
