SELECT
  n.region,
  AVG(cpu_pct) AS avg_cpu
FROM infra_nodes AS n
GROUP BY region
ORDER BY region
