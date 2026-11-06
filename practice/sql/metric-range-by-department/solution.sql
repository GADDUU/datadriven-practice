SELECT
  department,
  ROUND(AVG(metric_value), 2) AS avg_value,
  MIN(metric_value) AS min_value,
  MAX(metric_value) AS max_value
FROM employee_metrics
GROUP BY department
ORDER BY avg_value DESC
