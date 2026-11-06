SELECT
  SUM(t.total_amount) FILTER(WHERE EXTRACT(YEAR FROM signup_date) = 2026) AS total_revenue
FROM transactions AS t
INNER JOIN users AS u
  ON t.user_id = u.user_id
