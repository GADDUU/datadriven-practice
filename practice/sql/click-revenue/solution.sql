SELECT
  ad_campaign,
  SUM(revenue) AS clock_revenue
FROM ad_impressions
WHERE clicked > 0
  AND revenue IS NOT NULL
  AND user_id IS NOT NULL
GROUP BY ad_campaign
HAVING SUM(revenue) >= 5
