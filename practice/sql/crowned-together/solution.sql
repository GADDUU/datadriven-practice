WITH user_transactions AS (
  SELECT
    u.user_id,
    u.username,
    COUNT(t.transaction_id) AS transaction_count
  FROM users AS u
  INNER JOIN transactions AS t
    ON u.user_id = t.user_id
  GROUP BY u.user_id
)
  
SELECT
  username
FROM user_transactions
WHERE transaction_count = (
  SELECT
    MAX(transaction_count)
  FROM user_transactions
)
