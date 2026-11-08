WITH user_spending AS (
  SELECT
    u.user_id,
    u.account_status,
    SUM(t.total_amount) AS total_spending
  FROM users AS u
  INNER JOIN transactions AS t
    ON u.user_id = t.user_id
  GROUP BY u.user_id
)
  
SELECT
  account_status,
  AVG(total_spending) AS avg_total_spending
FROM user_spending
GROUP BY account_status
