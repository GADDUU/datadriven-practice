SELECT
  COUNT(*) FILTER(
    WHERE transaction_date >= '2026-09-17' - INTERVAL '30 days'
      AND transaction_date <= '2026-09-17'
  ) AS last_30,
  COUNT(*) FILTER(
    WHERE transaction_date >= '2026-09-17' - INTERVAL '180 days'
      AND transaction_date <= '2026-09-17'
  ) AS last_180,
  COUNT(*) FILTER(
    WHERE transaction_date <= '2026-09-17'
  ) AS all_time
FROM transactions
