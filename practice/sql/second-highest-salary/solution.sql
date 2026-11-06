SELECT DISTINCT
  salary AS second_highest
FROM (
  SELECT
    salary,
    DENSE_RANK() OVER(ORDER BY salary DESC) AS rnk
  FROM employees
)
WHERE rnk = 2
