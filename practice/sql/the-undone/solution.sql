SELECT
  db_name,
  COUNT(*) AS total_migrations,
  COUNT(*) FILTER(WHERE LOWER(status) = 'applied') AS applied_migrations,
  COUNT(*) FILTER(WHERE LOWER(status) = 'rolled_back') AS total_rollbacks
FROM migrations
GROUP BY db_name
HAVING total_rollbacks * 2 >= applied_migrations
ORDER BY total_rollbacks DESC
