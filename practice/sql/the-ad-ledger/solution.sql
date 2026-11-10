SELECT
  SUM(revenue) AS total_revenue
FROM ad_impressions
WHERE EXTRACT(QUARTER FROM impression_time) = 2
  AND EXTRACT(YEAR FROM impression_time) = 2024
