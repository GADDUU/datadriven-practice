SELECT
  department,
  fiscal_year,
  AVG(metric_value) AS avg_metric_value
FROM employee_metrics
GROUP BY department, fiscal_year
ORDER BY department, fiscal_year
