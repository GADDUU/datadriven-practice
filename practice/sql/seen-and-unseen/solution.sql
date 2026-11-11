SELECT
  platform,
  ROUND(100.0 * SUM(opened) / COUNT(*), 3) AS open_rate_pct
FROM push_notifs_2fa
GROUP BY platform
ORDER BY open_rate_pct DESC
