SELECT
  u.username
FROM users AS u
WHERE EXISTS (
    SELECT
      1
    FROM search_queries AS sq
    WHERE sq.user_id = u.user_id
  )
  AND EXISTS (
    SELECT
      1
    FROM page_views AS pv
    WHERE pv.user_id = u.user_id
  )
  AND EXISTS (
    SELECT
      1
    FROM transactions AS t
    WHERE t.user_id = u.user_id
  )
ORDER BY u.username
