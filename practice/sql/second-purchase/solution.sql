WITH ranked_transactions AS (
  SELECT
    user_id,
    total_amount,
    transaction_date,
    ROW_NUMBER() OVER (
      PARTITION BY user_id
      ORDER BY transaction_date
    ) AS trans_rank
  FROM transactions
)

SELECT
  user_id,
  total_amount,
  transaction_date AS second_purchase_date
FROM ranked_transactions
WHERE trans_rank = 2
ORDER BY second_purchase_date
