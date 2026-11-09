SELECT
  user_id,
  total_amount,
  transaction_date
FROM (
  SELECT
    user_id,
    total_amount,
    transaction_date,
    ROW_NUMBER() OVER(PARTITION BY user_id ORDER BY transaction_date ASC) AS rnk
  FROM transactions
)
WHERE rnk = 2
ORDER BY user_id
