SELECT
  region,
  node_type,
  AVG(cpu_pct) AS avg_cpu_pct,
  AVG(mem_pct) AS avg_cpu_pct
FROM infra_nodes
GROUP BY region, node_type
