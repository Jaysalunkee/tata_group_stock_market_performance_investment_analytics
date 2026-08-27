--Stock Performance Analysis

--Q1 Average Stock Price
SELECT
    [Company_Name],
    ROUND(AVG(Adjusted_Close), 2) AS Average_Close_Price
FROM tata_group_stock_cleaned
GROUP BY [Company_Name]
ORDER BY Average_Close_Price DESC;

--Q2 Highest and Lowest Closing Price
SELECT
    [Company_Name],
    MAX(Adjusted_Close) AS Highest_Close,
    MIN(Adjusted_Close) AS Lowest_Close
FROM tata_group_stock_cleaned
GROUP BY [Company_Name]
ORDER BY Highest_Close DESC;


--Q3 Stock Price Range
SELECT
    [Company_Name],
    ROUND(MAX(High) - MIN(Low), 2) AS Overall_Price_Range
FROM tata_group_stock_cleaned
GROUP BY [Company_Name]
ORDER BY Overall_Price_Range DESC;

--Q4 Top Stocks by Average Closing Price
SELECT TOP 5
    [Company_Name],
    ROUND(AVG(Adjusted_Close), 2) AS Average_Close_Price
FROM tata_group_stock_cleaned
GROUP BY [Company_Name]
ORDER BY Average_Close_Price DESC;

--Q5 Yearly Average Closing Price
SELECT
    [Company_Name],
    Year,
    ROUND(AVG(Adjusted_Close), 2) AS Average_Close_Price
FROM tata_group_stock_cleaned
GROUP BY [Company_Name], Year
ORDER BY [Company_Name], Year;



SELECT * FROM tata_group_stock_cleaned