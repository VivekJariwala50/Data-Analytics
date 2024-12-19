SELECT 
    date,
    [Open],
    [Close],
    ROUND((([Close] - [Open]) / [Open]) * 100, 2) AS price_change_percentage
FROM 
    StockData
ORDER BY 
    price_change_percentage DESC

