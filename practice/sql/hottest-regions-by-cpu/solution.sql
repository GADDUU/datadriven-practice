SELECT
  region,
  ROUND(AVG(cpu_pct), 2) AS avg_cpu
FROM infra_nodes
GROUP BY region
ORDER BY avg_cpu DESC
LIMIT 3
