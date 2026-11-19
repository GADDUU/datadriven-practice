SELECT DISTINCT
  t1.user_id,
  t1.transaction_date
FROM transactions AS t1
WHERE EXISTS (
  SELECT
    1
  FROM transactions AS t2
  WHERE t2.user_id = t1.user_id
    AND t2.transaction_date > t1.transaction_date
    AND t2.transaction_date <= t1.transaction_date + INTERVAL 7 DAY
)
ORDER BY t1.user_id, t1.transaction_date
