SELECT
  *
FROM employee_metrics
WHERE (CAST(metric_value AS DOUBLE) <= 30
  OR CAST(metric_value AS DOUBLE) >= 60)
  AND metric_name = 'headcount'
ORDER BY CAST(metric_value AS DOUBLE) DESC
