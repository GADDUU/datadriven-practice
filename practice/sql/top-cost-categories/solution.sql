WITH allocation_categories AS (
  SELECT DISTINCT
    svc_name,
    region,
    period,
    category
  FROM cost_allocs
)

SELECT
  ac.category,
  SUM(cc.amount) AS attributed_spend
FROM cloud_costs AS cc
JOIN allocation_categories AS ac
  ON cc.svc_name = ac.svc_name
    AND cc.region = ac.region
    AND TO_CHAR(cc.bill_date, 'YYYY-MM') = ac.period
GROUP BY ac.category
ORDER BY attributed_spend DESC
LIMIT 3
