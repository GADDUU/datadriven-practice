WITH ranked_transactions AS (
  SELECT
    user_id,
    transaction_date,
    COUNT(transaction_id) AS purchase_count,
    ROW_NUMBER() OVER(PARTITION BY user_id ORDER BY transaction_date DESC) AS rnk
  FROM transactions 
  GROUP BY user_id, transaction_date
)
  
SELECT
  transaction_date,
  user_id,
  purchase_count
FROM ranked_transactions
WHERE rnk = 1
ORDER BY transaction_date
