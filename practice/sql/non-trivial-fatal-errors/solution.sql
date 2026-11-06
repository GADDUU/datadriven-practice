SELECT
  err_id,
  message,
  svc_name,
  CASE
    WHEN LENGTH(message) < 30 THEN 'short'
    WHEN LENGTH(message) >= 32 THEN 'long'
    ELSE 'mid'
  END AS length_category
FROM err_tracks
WHERE LOWER(severity) = 'fatal'
  AND length_category <> 'short'
GROUP BY err_id
