--03. Return Analysis

-- Q1 Average Daily Return
SELECT
    [Company_Name],
    ROUND(AVG([Daily_Return]), 4) AS Average_Daily_Return
FROM tata_group_stock_cleaned
GROUP BY [Company_Name]
ORDER BY Average_Daily_Return DESC;

--Q2 Best Daily Return
SELECT
    [Company_Name],
    MAX([Daily_Return]) AS Best_Daily_Return
FROM tata_group_stock_cleaned
GROUP BY [Company_Name]
ORDER BY Best_Daily_Return DESC;

--Q3 Worst Daily Return
SELECT
    [Company_Name],
    MIN([Daily_Return]) AS Worst_Daily_Return
FROM tata_group_stock_cleaned
GROUP BY [Company_Name]
ORDER BY Worst_Daily_Return ASC;

--Q4 Positive vs Negative Trading Days
SELECT
    [Company_Name],
    SUM(CASE WHEN [Daily_Return] > 0 THEN 1 ELSE 0 END) AS Positive_Days,
    SUM(CASE WHEN [Daily_Return] < 0 THEN 1 ELSE 0 END) AS Negative_Days,
    SUM(CASE WHEN [Daily_Return] = 0 THEN 1 ELSE 0 END) AS No_Change_Days
FROM tata_group_stock_cleaned
GROUP BY [Company_Name]
ORDER BY Positive_Days DESC;


--Q5 Monthly Return Performance
SELECT
    [Company_Name],
    Year,
    Month_Name,
    ROUND(AVG([Daily_Return]), 4) AS Average_Daily_Return
FROM tata_group_stock_cleaned
GROUP BY
    [Company_Name],
    Year,
    Month,
    Month_Name
ORDER BY
    [Company_Name],
    Year,
    Month;
    

SELECT * FROM tata_group_stock_cleaned