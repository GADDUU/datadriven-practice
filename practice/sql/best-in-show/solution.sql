WITH ranked_metrics AS (
  SELECT
    department,
    metric_name,
    metric_value,
    ROW_NUMBER() OVER(PARTITION BY department ORDER BY metric_value DESC) AS rnk
  FROM employee_metrics
)
  
SELECT
  *
FROM ranked_metrics
WHERE rnk = 1
ORDER BY department
