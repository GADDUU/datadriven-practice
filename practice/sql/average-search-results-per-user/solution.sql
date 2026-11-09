SELECT
  user_id,
  AVG(results_count) AS avg_results
FROM search_queries
WHERE user_id IS NOT NULL
GROUP BY user_id
ORDER BY user_id ASC
