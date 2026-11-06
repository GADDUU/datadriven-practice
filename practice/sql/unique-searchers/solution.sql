SELECT
  COUNT(DISTINCT user_id) AS unique_searchers
FROM search_queries
--WHERE results_count IS NOT NULL
