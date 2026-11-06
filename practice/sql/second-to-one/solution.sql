WITH ranked_salary AS (
  SELECT
    department,
    salary,
    DENSE_RANK() OVER(PARTITION BY department ORDER BY salary DESC) AS rnk
  FROM employees
)
   
SELECT DISTINCT
  department,
  salary
FROM ranked_salary
WHERE rnk = 2
ORDER BY department
--LIMIT 1
