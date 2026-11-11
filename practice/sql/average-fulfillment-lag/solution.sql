SELECT 
    user_id,
    AVG(julianday('now') - julianday(transaction_date)) AS avg_days
FROM transactions
WHERE total_amount > 0
GROUP BY user_id
ORDER BY avg_days DESC;
