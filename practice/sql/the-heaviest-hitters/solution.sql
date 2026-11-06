SELECT
  impression_time,
  revenue
FROM ad_impressions
ORDER BY revenue DESC, impression_time
LIMIT 3
