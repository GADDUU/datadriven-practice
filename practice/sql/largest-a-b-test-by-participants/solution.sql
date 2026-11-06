SELECT
  test_name,
  COUNT(DISTINCT user_id) AS unique_participants
FROM ab_results 
GROUP BY test_name
ORDER BY unique_participants DESC, test_name
LIMIT 1
