SELECT
  variant,
  AVG(value) AS avg_value
FROM ab_results
GROUP BY variant
ORDER BY avg_value DESC
LIMIT 1
