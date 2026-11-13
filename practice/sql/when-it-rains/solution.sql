SELECT
  *
FROM err_tracks
WHERE (
  CASE
    WHEN err_type LIKE '%Error%' THEN 1
    ELSE 0
  END
) + (
  CASE
    WHEN message LIKE '%null%' THEN 1
    ELSE 0
  END
) + (
  CASE
    WHEN svc_name LIKE '%api%' THEN 1
    ELSE 0
  END
) + (
  CASE
    WHEN severity IN ('error', 'ERROR') THEN 1
    ELSE 0
  END
) >= 2
