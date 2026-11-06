SELECT
  ad_campaign,
  SUM(revenue) AS total_revenue
FROM ad_impressions
WHERE EXTRACT(YEAR FROM impression_time) = 2026
GROUP BY ad_campaign
ORDER BY total_revenue DESC
