WITH transaction_per_users AS (
  SELECT
    user_id,
    COUNT(transaction_id) AS transaction_count
  FROM transactions
  GROUP BY user_id
  ORDER BY user_id
)

SELECT
  ROUND(
    CAST(
      (COUNT(*) FILTER (
        WHERE transaction_count > avg_transaction_count
      )) * 100
      AS DOUBLE
    ) / COUNT(*),
    2
  ) AS above_avg_number_pct
FROM (
  SELECT
    transaction_count,
    AVG(transaction_count) OVER (
    ) AS avg_transaction_count
  FROM transaction_per_users
)
