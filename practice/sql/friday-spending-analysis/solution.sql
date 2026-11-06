SELECT 
    CAST(strftime('%W', transaction_date) AS INTEGER) AS week_number,
    AVG(total_amount) AS avg_amount
FROM 
    transactions
WHERE 
    strftime('%w', transaction_date) = '5'
    AND strftime('%m', transaction_date) IN ('01', '02', '03')
GROUP BY 
    week_number
ORDER BY 
    week_number ASC;
