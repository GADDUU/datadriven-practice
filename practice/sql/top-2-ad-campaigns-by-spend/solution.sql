SELECT
  ad_campaign,
  SUM(revenue) AS total_revenue
FROM ad_impressions 
GROUP BY ad_campaign
ORDER BY total_revenue DESC
LIMIT 2
