SELECT
  ad_campaign
FROM ad_impressions
WHERE TO_CHAR(impression_time, 'YYYY-MM') <= '2026-06'
GROUP BY ad_campaign
HAVING SUM(revenue) > 4.5
