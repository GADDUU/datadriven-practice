WITH ranking AS (
  SELECT
    CASE
      WHEN profit > 100 THEN 'high'
      WHEN profit < 0 THEN 'negative'
      ELSE 'moderate'
    END AS tier
  FROM orders
)

SELECT
  tier,
  COUNT(tier) AS order_count
FROM ranking
GROUP BY tier
