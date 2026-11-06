SELECT
  t.transaction_id,
  u.username,
  t.total_amount,
  SUM(t.total_amount) OVER(ORDER BY t.transaction_id ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS running_total
FROM transactions AS t
INNER JOIN users AS u
  ON t.user_id = u.user_id
WHERE u.username IN ('alice', 'aaron42')
ORDER BY t.transaction_id
