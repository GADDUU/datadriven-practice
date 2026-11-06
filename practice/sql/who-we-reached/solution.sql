SELECT
  ad_campaign,
  EXTRACT(MONTH FROM impression_time) AS month,
  COUNT(DISTINCT user_id) AS unique_users
FROM ad_impressions
GROUP BY ad_campaign, EXTRACT(MONTH FROM impression_time)
ORDER BY ad_campaign, month
