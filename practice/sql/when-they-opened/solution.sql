SELECT
  EXTRACT(MONTH FROM sent_at) AS month,
  SUM(opened) AS opened_count
FROM push_notifs
GROUP BY month
HAVING SUM(opened) <> 0
ORDER BY opened_count DESC
