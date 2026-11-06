SELECT
  region,
  COUNT(node_id) AS total_nodes,
  COUNT(DISTINCT node_type) AS unique_types
FROM infra_nodes
GROUP BY region
ORDER BY total_nodes DESC, region
