SELECT
  provider,
  avg_07 - avg_01 AS amount_change
FROM (
  SELECT
    UPPER(provider) AS provider,
    AVG(amount) FILTER(WHERE EXTRACT(MONTH FROM bill_date) = 1) AS avg_01,
    AVG(amount) FILTER(WHERE EXTRACT(MONTH FROM bill_date) = 7) AS avg_07
  FROM cloud_costs
  GROUP BY UPPER(provider)
)
ORDER BY provider
