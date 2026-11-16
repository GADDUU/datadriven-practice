WITH svc_spend AS (
  SELECT
    svc_name,
    SUM(amount) AS total_amount
  FROM cloud_costs
  WHERE amount > 0
  GROUP BY svc_name
),
lowest AS (
  SELECT
    svc_name,
    total_amount
  FROM svc_spend
  ORDER BY total_amount
  LIMIT 3
),
highest AS (
  SELECT
    svc_name,
    total_amount
  FROM svc_spend
  ORDER BY total_amount DESC
  LIMIT 3
)

SELECT
  *
FROM lowest

UNION ALL

SELECT
  *
FROM highest
ORDER BY total_amount
