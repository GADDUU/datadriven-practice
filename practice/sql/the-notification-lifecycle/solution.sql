SELECT
  u.user_id,
  COUNT(*) FILTER(WHERE LOWER(n.status) = 'delivered') AS delivered_count,
  COUNT(*) FILTER(WHERE LOWER(n.opened = 'true')) AS opened_count,
  COUNT(*) FILTER(WHERE LOWER(n.status) = 'failed') AS failed_count
FROM users AS u
INNER JOIN push_notifs AS n
  ON u.user_id = n.user_id
GROUP BY u.user_id
