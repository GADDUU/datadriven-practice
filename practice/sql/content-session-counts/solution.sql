SELECT
  LOWER(p.page_url) AS page_url,
  COUNT(DISTINCT session_id) AS unique_sessions
FROM page_views AS p
INNER JOIN user_sessions AS s
  ON p.user_id = s.user_id
GROUP BY LOWER(p.page_url)
ORDER BY unique_sessions DESC
