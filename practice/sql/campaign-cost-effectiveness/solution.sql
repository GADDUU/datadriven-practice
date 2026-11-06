WITH CTE AS (
  SELECT
    ad_campaign,
    COUNT(*) FILTER(WHERE EXTRACT(YEAR FROM impression_time) = 2024) AS impression_2024,
    COUNT(*) FILTER(WHERE EXTRACT(YEAR FROM impression_time) = 2025) AS impression_2025,
    SUM(revenue) FILTER(WHERE EXTRACT(YEAR FROM impression_time) IN (2024, 2025)) AS total_revenue
  FROM ad_impressions
  GROUP BY ad_campaign
)
  
SELECT
  ad_campaign,
  total_revenue,
  ROUND(CAST(impression_2025 AS DOUBLE) / (impression_2024 + impression_2025), 3) AS recent_share
FROM CTE
