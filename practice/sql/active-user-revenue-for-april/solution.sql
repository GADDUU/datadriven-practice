SELECT
  SUM(t.total_amount * quantity) AS total_revenue
FROM transactions AS t
INNER JOIN users AS u
  ON t.user_id = u.user_id
WHERE LOWER(u.account_status) = 'active'
  AND TO_CHAR(t.transaction_date, 'YYYY-MM') = '2026-04'
