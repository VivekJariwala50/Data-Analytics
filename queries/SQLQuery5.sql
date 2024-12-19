WITH Avg_Volume AS (
    SELECT 
        AVG(volume) AS avg_volume
    FROM 
        stockData
    WHERE 
        CAST(Date AS DATE) BETWEEN DATEADD(DAY, -30, GETDATE()) AND GETDATE()
)
SELECT 
    Date,
    Volume,
    (([Close] - [Open]) / [Open]) * 100 AS price_change_percentage
FROM 
    stockData, Avg_Volume
WHERE 
    Volume > (2 * avg_volume)
    AND ABS((([Close] - [Open]) / [Open]) * 100) > 5
ORDER BY 
    Volume DESC;
