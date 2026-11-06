SELECT
  ad_campaign,
  COUNT(*) AS total_clicks,
  MAX(revenue) AS max_impression_revenue
FROM ad_impressions
WHERE clicked <> 0
GROUP BY ad_campaign
--HAVING total_clicks <> 0
ORDER BY total_clicks DESC, ad_campaign
