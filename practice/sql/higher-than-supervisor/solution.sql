WITH managers AS (
  SELECT
    employee_id AS manager_id,
    emp_name AS mng_name,
    salary
  FROM employees
  WHERE manager_id IS NULL
)

SELECT
  e.emp_name AS employee,
  e.salary AS emp_salary,
  m.mng_name AS manager,
  m.salary AS mng_salary
FROM employees AS e
INNER JOIN managers AS m
  ON e.manager_id = m.manager_id
  AND e.salary > m.salary
ORDER BY emp_salary - mng_salary DESC, employee ASC
