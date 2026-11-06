SELECT
  department,
  COUNT(*) FILTER(WHERE fiscal_quarter = 'Q1') AS q1,
  COUNT(*) FILTER(WHERE fiscal_quarter = 'Q2') AS q2,
  COUNT(*) FILTER(WHERE fiscal_quarter = 'Q3') AS q3,
  COUNT(*) FILTER(WHERE fiscal_quarter = 'Q4') AS q4  
FROM employee_metrics
GROUP BY department
