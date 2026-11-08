SELECT
  region, 
  node_type,
  COUNT(node_id) AS node_count
FROM infra_nodes
GROUP BY region, node_type
ORDER BY region ASC
