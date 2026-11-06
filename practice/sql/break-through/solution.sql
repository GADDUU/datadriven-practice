SELECT
  ad_campaign,
  ROUND(CAST(SUM(clicked) AS DOUBLE) / COUNT(*) * 100, 2) AS str_pct,
  SUM(revenue) AS total_revenue,
  COUNT(*) AS impressions
FROM ad_impressions
GROUP BY ad_campaign
HAVING ROUND(CAST(SUM(clicked) AS DOUBLE) / COUNT(*) * 100, 3) >= 20
ORDER BY str_pct DESC, ad_campaign
