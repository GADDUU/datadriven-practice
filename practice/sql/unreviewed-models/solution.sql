SELECT
  m.mdl_name,
  m.version,
  m.framework,
  m.status
FROM ml_models AS m
WHERE m.train_at IS NOT NULL
  AND NOT EXISTS (
    SELECT
      1
    FROM dq_checks AS d
    WHERE CAST(d.run_at AS DATE) = CAST(m.train_at AS DATE)
      AND d.passed = 0
  )
