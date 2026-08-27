--04. Risk & Volatility Analysis

--Q1 Average Volatility by Company
SELECT
    [Company_Name],
    ROUND(AVG(Volatility_30D), 4) AS Average_Volatility
FROM tata_group_stock_cleaned
GROUP BY [Company_Name]
ORDER BY Average_Volatility DESC;

--Q2 Most Volatile Stocks
SELECT TOP 5
    [Company_Name],
    ROUND(AVG(Volatility_30D), 4) AS Average_Volatility
FROM tata_group_stock_cleaned
GROUP BY [Company_Name]
ORDER BY Average_Volatility DESC;

--Q3 Least Volatile Stocks
SELECT TOP 5
    [Company_Name],
    ROUND(AVG(Volatility_30D), 4) AS Average_Volatility
FROM tata_group_stock_cleaned
GROUP BY [Company_Name]
ORDER BY Average_Volatility ASC;

--Q4 Return vs Risk Analysis
SELECT
    [Company_Name],
    ROUND(AVG([Daily_Return]), 4) AS Average_Return,
    ROUND(AVG(Volatility_30D), 4) AS Average_Volatility
FROM tata_group_stock_cleaned
GROUP BY [Company_Name]
ORDER BY Average_Return DESC;