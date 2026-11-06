WITH service_spend AS (
  SELECT
    svc_name,
    SUM(amount) AS total_spend
  FROM cloud_costs
  WHERE TO_CHAR(bill_date, 'YYYY-MM') = '2026-05'
  GROUP BY svc_name
),
ranked_services AS (
  SELECT
    svc_name,
    total_spend,
    NTILE(4) OVER(
      ORDER BY total_spend ASC
    ) AS spend_tier
  FROM service_spend
)
  
SELECT
  svc_name,
  total_spend
FROM ranked_services
WHERE spend_tier = 1
