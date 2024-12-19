WITH Price_Diffs AS (
    SELECT 
        Date,
        [Close],
        LAG(Date) OVER (ORDER BY Date) AS prev_date,
        LAG([Close]) OVER (ORDER BY Date) AS prev_close
    FROM 
        StockData
),
Date_Diffs AS (
    SELECT 
        Date,
        [Close],
        prev_date,
        DATEDIFF(DAY, prev_date, Date) AS days_diff,
        prev_close
    FROM 
        Price_Diffs
    WHERE 
        [Close] < prev_close -- Filter price drops
)
SELECT 
    MIN(Date) AS start_date,
    MAX(Date) AS end_date,
    MIN([Close]) AS lowest_price
FROM 
    Date_Diffs
GROUP BY 
    days_diff
ORDER BY 
    lowest_price ASC;
