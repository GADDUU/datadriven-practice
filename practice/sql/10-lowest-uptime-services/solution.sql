WITH LowestUpTime AS (
  SELECT
    svc_name,
    MIN(uptime) AS min_uptime
  FROM svc_health
  GROUP BY svc_name
),
RankLowestUpTime AS (
  SELECT
    svc_name,
    min_uptime,
    RANK() OVER (ORDER BY min_uptime) AS rnk
  FROM LowestUpTime
)

SELECT
  svc_name,
  min_uptime
FROM RankLowestUpTime
WHERE rnk <= 10
ORDER BY min_uptime
