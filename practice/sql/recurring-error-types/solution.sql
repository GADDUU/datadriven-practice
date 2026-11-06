SELECT
  message
FROM (
  SELECT
    message,
    COUNT(*) AS cnt
  FROM err_tracks
  WHERE svc_name = 'payment-api'
  GROUP BY message
) AS CTE
WHERE cnt > 3
