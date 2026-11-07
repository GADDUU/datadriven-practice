SELECT DISTINCT
  metric_value AS benchmark_value
FROM employee_metrics
ORDER BY metric_value DESC
LIMIT 5
