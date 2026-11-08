SELECT
  region,
  COUNT(*) AS node_count
FROM infra_nodes
GROUP BY region
