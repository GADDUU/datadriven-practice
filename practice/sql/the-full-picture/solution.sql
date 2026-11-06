WITH table1 AS (
  SELECT
    department,
    SUM(salary) AS total_payroll
  FROM employees
  GROUP BY department
),
table2 AS (
  SELECT
    department,
    SUM(metric_value) AS q1_metric_total
  FROM employee_metrics
  WHERE fiscal_quarter = 'Q1'
  GROUP BY department
)
  
SELECT
  t1.department,
  t1.total_payroll,
  COALESCE(t2.q1_metric_total, 0) AS q1_metric_total
FROM table1 AS t1
LEFT JOIN table2 AS t2
  ON t1.department = t2.department
