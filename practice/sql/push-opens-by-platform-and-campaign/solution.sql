SELECT
  platform,
  COUNT(DISTINCT user_id) AS unique_openers
FROM push_notifs
WHERE opened <> 0
GROUP BY platform
ORDER BY unique_openers DESC
