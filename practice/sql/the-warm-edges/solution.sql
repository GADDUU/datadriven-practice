SELECT
  edge_loc,
  req_path,
  AVG(bytes) AS avg_bytes
FROM cdn_logs
WHERE req_path LIKE '%api%'
GROUP BY edge_loc, req_path
ORDER BY avg_bytes ASC
