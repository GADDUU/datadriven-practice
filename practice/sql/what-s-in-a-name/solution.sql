SELECT
  initial,
  COUNT(user_id) AS user_count,
  ROUND(CAST(COUNT(user_id) AS DOUBLE) / total_user * 100, 3) AS pct
FROM (
  SELECT
    LOWER(SUBSTR(TRIM(username), 1, 1)) AS initial,
    user_id,
    COUNT(*) OVER() AS total_user
  FROM users
) AS data
GROUP BY initial
ORDER BY pct DESC
