WITH ranked_spend AS (
  SELECT
    LOWER(provider) AS provider,
    svc_name AS top_service,
    SUM(amount) AS total_spend,
    ROW_NUMBER() OVER(PARTITION BY LOWER(provider) ORDER BY SUM(amount) DESC) AS rnk
  FROM cloud_costs
  GROUP BY LOWER(provider), svc_name
)
  
SELECT
  provider,
  top_service,
  total_spend
FROM ranked_spend
WHERE rnk = 1
