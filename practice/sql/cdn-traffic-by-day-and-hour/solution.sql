SELECT
  TO_CHAR(served_at, 'FMDay') AS weekday,
  EXTRACT(HOUR FROM served_at) AS hour,
  AVG(bytes * 0.95) AS avg_net_bytes
FROM cdn_logs
GROUP BY TO_CHAR(served_at, 'FMDay'), EXTRACT(HOUR FROM served_at)
ORDER BY EXTRACT(DOW FROM served_at)
