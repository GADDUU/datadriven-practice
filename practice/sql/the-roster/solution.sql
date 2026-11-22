SELECT
  department,
  COUNT(user_id) AS linked_employees
FROM employees
GROUP BY department
ORDER BY linked_employees DESC
