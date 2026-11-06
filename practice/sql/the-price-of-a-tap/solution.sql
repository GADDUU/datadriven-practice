SELECT
  campaign,
  EXTRACT(YEAR FROM sent_at) AS year,
  ROUND(
    CAST(COUNT(*) AS DOUBLE) / SUM(opened),
    3
  ) AS cost_per_open
FROM push_notifs
WHERE campaign IS NOT NULL
   AND LOWER(status) <> 'pending'
GROUP BY campaign, year
HAVING SUM(opened) <> 0
