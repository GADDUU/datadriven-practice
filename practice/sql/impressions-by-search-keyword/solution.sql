WITH distinct_users AS (
  SELECT DISTINCT
    user_id
  FROM search_queries
)

SELECT
  ai.ad_campaign,
  COUNT(ai.impression_id) AS impression_count
FROM ad_impressions AS ai
INNER JOIN distinct_users AS du
  ON ai.user_id = du.user_id
WHERE ai.ad_campaign NOT LIKE '%SALE%'
GROUP BY ai.ad_campaign
ORDER BY impression_count DESC
