SELECT
  ad_campaign,
  COUNT(DISTINCT impression_id) AS total_impressions,
  ROUND(CAST(SUM(clicked) AS DOUBLE) / COUNT(*) * 100, 2) AS clicked_pct,
  ROUND(100 - (CAST(SUM(clicked) AS DOUBLE) / COUNT(*) * 100), 2) AS not_clicked_pct
FROM ad_impressions
GROUP BY ad_campaign
ORDER BY ad_campaign
