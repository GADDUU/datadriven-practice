SELECT
  ad_campaign,
  COUNT(impression_id) AS impressions,
  SUM(revenue) AS total_revenue,
  ROUND(
    CAST(SUM(clicked) AS DOUBLE) / COUNT(
      impression_id
      ) * 100,
    1
    ) AS ctr
FROM ad_impressions
GROUP BY ad_campaign
HAVING COUNT(impression_id) > 15
ORDER BY ROUND(
  CAST(SUM(clicked) AS DOUBLE) / COUNT(
    impression_id
    ) * 100,
  1
  ) DESC, ad_campaign
