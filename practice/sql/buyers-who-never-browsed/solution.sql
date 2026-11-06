SELECT
  u.username,
  t.total_amount
FROM transactions AS t
JOIN users AS u
  ON t.user_id = u.user_id
WHERE STRFTIME('%Y', t.transaction_date) = '2026'
  AND NOT EXISTS (
    SELECT
      1
    FROM page_views AS pv
    WHERE pv.user_id = t.user_id
  )
ORDER BY t.total_amount
