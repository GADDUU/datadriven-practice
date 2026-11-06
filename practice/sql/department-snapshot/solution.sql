SELECT
  department,
  COUNT(metric_value) AS valid_reading,
  MIN(metric_value) AS min_metrics,
  MAX(metric_value) AS max_metrics,
  AVG(metric_value) AS avg_metrics,
  MAX(metric_value) - MIN(metric_value) AS spread
FROM employee_metrics
GROUP BY department
