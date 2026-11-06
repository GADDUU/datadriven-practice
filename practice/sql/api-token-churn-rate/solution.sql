SELECT
    1.0 * SUM(
        CASE
            WHEN expires < CURRENT_DATE THEN 1
            ELSE 0
        END
    ) / COUNT(*) AS churn_rate
FROM api_tokens;
