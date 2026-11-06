SELECT
  ai.ad_campaign,
  sq.clicked_result,
  COUNT(DISTINCT sq.query_id) AS event_count
FROM search_queries AS sq
LEFT JOIN ad_impressions AS ai
  ON sq.user_id = ai.user_id
WHERE ai.ad_campaign IS NOT NULL
GROUP BY ai.ad_campaign, sq.clicked_result
ORDER BY ai.ad_campaign, sq.clicked_result
