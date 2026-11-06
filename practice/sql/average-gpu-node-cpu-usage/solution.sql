SELECT
  AVG(cpu_pct) FILTER (
    WHERE node_type = 'gpu'
  ) AS avg_cpu_pct
FROM infra_nodes
