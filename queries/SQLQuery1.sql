SELECT 
    Date,
    [Close],
    AVG([Close]) OVER (ORDER BY Date ROWS BETWEEN 6 PRECEDING AND CURRENT ROW) AS moving_avg_7_day
FROM 
    StockData
ORDER BY 
    Date;