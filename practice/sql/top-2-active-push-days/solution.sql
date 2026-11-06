SELECT
  'Month ' || CAST(EXTRACT(MONTH FROM sent_at) AS STRING) AS send_month,
  COUNT(DISTINCT title) AS unique_titles
FROM push_notifs
GROUP BY send_month
ORDER BY unique_titles DESC
