WITH revenue AS (
  SELECT
    ad_campaign,
    EXTRACT(YEAR FROM impression_time) AS impression_year,
    SUM(COALESCE(revenue, 0)) AS total_revenue,
    COUNT(DISTINCT user_id) AS unique_users
  FROM ad_impressions
  GROUP BY ad_campaign, impression_year
)

--SELECT
--  ad_campaign,
--   impression_year,
--  unique_users 
--FROM ad_impressions

SELECT
  ad_campaign,
  impression_year,
  unique_users
FROM revenue
WHERE total_revenue > 5
