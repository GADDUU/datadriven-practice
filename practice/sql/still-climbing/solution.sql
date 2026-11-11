SELECT
  svc_name,
  NULLIF(100 * march_count / (february_count + march_count), 100) AS march_share_pct
FROM (
  SELECT
    svc_name,
    COUNT(check_id) FILTER(WHERE TO_CHAR(checked, 'YYYY-MM') = '2026-02') AS february_count,
    COUNT(check_id) FILTER(WHERE TO_CHAR(checked, 'YYYY-MM') = '2026-03') AS march_count
  FROM svc_health
  GROUP BY svc_name
)
WHERE 100 * march_count / (february_count + march_count) IS NOT NULL
ORDER BY svc_name
