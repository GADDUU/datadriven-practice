WITH target_users AS (
  SELECT
    user_id
  FROM (
    SELECT
      u.user_id,
      ROW_NUMBER() OVER(ORDER BY u.signup_date ASC) AS earliest_user,
      ROW_NUMBER() OVER(ORDER BY u.signup_date DESC) AS latest_user
    FROM users AS u
    INNER JOIN user_sessions AS us
      ON u.user_id = us.user_id
  )
  WHERE earliest_user = 1
    OR latest_user = 1
)

SELECT
  us.*
FROM user_sessions AS us
INNER JOIN target_users AS tu
  ON us.user_id = tu.user_id
ORDER BY us.session_start
