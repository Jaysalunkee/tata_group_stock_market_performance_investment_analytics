--06. Advanced SQL Analysis

--Q1 Rank Companies by Average Return
WITH Company_Performance AS (
    SELECT
        [Company_Name],
        AVG([Daily_Return]) AS Average_Return
    FROM tata_group_stock_cleaned
    GROUP BY [Company_Name]
)
SELECT
    [Company_Name],
    ROUND(Average_Return, 4) AS Average_Return,
    RANK() OVER (
        ORDER BY Average_Return DESC
    ) AS Return_Rank
FROM Company_Performance
ORDER BY Return_Rank;

--q2 Rank Companies by Lowest Risk
WITH Risk_Analysis AS (
    SELECT
        [Company_Name],
        AVG(Volatility_30D) AS Average_Volatility
    FROM tata_group_stock_cleaned
    GROUP BY [Company_Name]
)
SELECT
    [Company_Name],
    ROUND(Average_Volatility, 4) AS Average_Volatility,
    RANK() OVER (
        ORDER BY Average_Volatility ASC
    ) AS Risk_Rank
FROM Risk_Analysis
ORDER BY Risk_Rank;

--Q3 Price Compared with 30-Day Moving Average
SELECT
    [Date],
    [Company_Name],
    Adjusted_Close,
    MA_30,
    CASE
        WHEN Adjusted_Close > MA_30 THEN 'Above MA30 - Bullish'
        WHEN Adjusted_Close < MA_30 THEN 'Below MA30 - Bearish'
        ELSE 'Equal to MA30'
    END AS Price_Position
FROM tata_group_stock_cleaned
ORDER BY [Company_Name], [Date];

--Q4 Monthly Performance Ranking
WITH Monthly_Performance AS (
    SELECT
        [Company_Name],
        Year,
        Month,
        Month_Name,
        AVG([Daily_Return]) AS Average_Return
    FROM tata_group_stock_cleaned
    GROUP BY
        [Company_Name],
        Year,
        Month,
        Month_Name
)
SELECT
    [Company_Name],
    Year,
    Month_Name,
    ROUND(Average_Return, 4) AS Average_Return,
    RANK() OVER (
        PARTITION BY Year, Month
        ORDER BY Average_Return DESC
    ) AS Monthly_Rank
FROM Monthly_Performance
ORDER BY Year, Month, Monthly_Rank;

--Q5 Investment Opportunity Ranking
WITH Investment_Analysis AS (
    SELECT
        [Company_Name],
        AVG([Daily_Return]) AS Average_Return,
        AVG(Volatility_30D) AS Average_Volatility,
        AVG(Volume) AS Average_Volume
    FROM tata_group_stock_cleaned
    GROUP BY [Company_Name]
)
SELECT
    [Company_Name],
    ROUND(Average_Return, 4) AS Average_Return,
    ROUND(Average_Volatility, 4) AS Average_Volatility,
    ROUND(Average_Volume, 0) AS Average_Volume,
    RANK() OVER (
        ORDER BY
            Average_Return DESC,
            Average_Volatility ASC
    ) AS Investment_Rank
FROM Investment_Analysis
ORDER BY Investment_Rank;