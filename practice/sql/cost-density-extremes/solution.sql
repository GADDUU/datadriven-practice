WITH base_data AS (
  SELECT
    LOWER(provider) AS provider,
    svc_name,
    region,
    amount,
    bill_date
  FROM cloud_costs
  WHERE bill_date NOT IN (
    SELECT
      MAX(bill_date)
    FROM cloud_costs
  )
),
target_data AS (
  SELECT
    region,
    provider,
    CAST(SUM(amount) / COUNT(DISTINCT svc_name) AS INTEGER) AS cost_density
  FROM base_data
  GROUP BY region, provider
),
ranked_density AS (
  SELECT
    region,
    provider,
    cost_density,
    ROW_NUMBER() OVER(PARTITION BY region ORDER BY cost_density ASC) AS asc_rnk,
    ROW_NUMBER() OVER(PARTITION BY region ORDER BY cost_density DESC) AS desc_rnk
  FROM target_data
)
  
SELECT
  region,
  provider,
  cost_density
FROM ranked_density
WHERE asc_rnk = 1 OR desc_rnk = 1
