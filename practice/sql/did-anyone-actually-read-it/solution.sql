SELECT
  LOWER(TRIM(platform)) AS platform,
  SUM(opened) AS opened_count
FROM push_notifs
WHERE EXTRACT(YEAR FROM sent_at) = 2026
  AND (LOWER(status) = 'delivered' AND opened <> 0)
GROUP BY LOWER(TRIM(platform))
ORDER BY opened_count DESC
