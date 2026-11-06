SELECT
  campaign,
  COUNT(*) AS open_count
FROM push_notifs
WHERE opened <> 0
  AND campaign IS NOT NULL
GROUP BY campaign
