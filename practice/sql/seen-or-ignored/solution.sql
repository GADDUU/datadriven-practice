SELECT
  platform,
  ROUND(1.0 * SUM(opened) / COUNT(*), 3) AS open_ration
FROM push_notifs
GROUP BY platform
ORDER BY open_ration DESC
