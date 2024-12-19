SELECT 
    Date,
    high,
    low,
    (high - low) AS price_range
FROM 
    stockData
ORDER BY 
    price_range DESC;
