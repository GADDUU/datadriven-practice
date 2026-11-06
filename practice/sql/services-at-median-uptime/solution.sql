WITH avg_uptime AS (
SELECT
  svc_name,
  AVG(uptime) AS avg_uptime
FROM svc_health
GROUP BY svc_name
),
tiered AS (
  SELECT
    svc_name, 
    avg_uptime,
    MAX(avg_uptime) OVER() AS best,
    NTILE(4) OVER(ORDER BY avg_uptime) AS tier
  FROM avg_uptime
)

SELECT
  svc_name,
  avg_uptime,
  best - avg_uptime AS gap_to_best,
  MAX(avg_uptime) OVER (PARTITION BY tier) - avg_uptime AS gap_to_tier_best
FROM tiered
WHERE tier <= 2 
ORDER BY svc_name
