WITH filter_data AS (
  SELECT
    metric_name,
    metric_value,
    CASE
      WHEN fiscal_quarter IN ('Q1', 'Q2') THEN 'H1'
      ELSE 'H2'
    END AS fiscal_half
  FROM employee_metrics
  WHERE metric_name NOT IN ('attrition_rate', 'diversity_ratio')
)

SELECT
  metric_name,
  fiscal_half,
  CAST(AVG(metric_value) AS INTEGER) AS avg_value
FROM filter_data
GROUP BY metric_name, fiscal_half
