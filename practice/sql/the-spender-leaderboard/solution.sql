SELECT
  *,
  ROW_NUMBER() OVER (
    ORDER BY total_spend DESC
  ) AS rnk
FROM (
  SELECT
    user_id,
    SUM(total_amount) AS total_spend
  FROM transactions --ROW_NUMBER() OVER(ORDER BY SUM(total_amount)) AS rnk
  GROUP BY user_id
  ORDER BY total_spend DESC
  LIMIT 5
)
