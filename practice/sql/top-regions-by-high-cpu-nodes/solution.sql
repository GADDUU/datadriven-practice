SELECT
  region,
  SUM(cpu_pct) AS total_cpu_pct
FROM infra_nodes
GROUP BY region
ORDER BY total_cpu_pct DESC
LIMIT 3
