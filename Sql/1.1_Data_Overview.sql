-- Q1 Dataset Overview
SELECT
    COUNT(*) AS Total_Records,
    COUNT(DISTINCT [Company_Name]) AS Total_Companies,
    COUNT(DISTINCT Sector) AS Total_Sectors,
    MIN([Date]) AS Start_Date,
    MAX([Date]) AS End_Date
FROM tata_group_stock_cleaned;

-- Q2 List All Companies
SELECT DISTINCT
    [Company_Name],
    [NSE_Symbol],
    Sector
FROM tata_group_stock_cleaned
ORDER BY [Company_Name];

--Q3  Number of records per company 
SELECT
    [Company_Name],
    COUNT(*) AS Total_Records
FROM tata_group_stock_cleaned
GROUP BY [Company_Name]
ORDER BY Total_Records DESC;


--Q4  Records by Sector
SELECT
    Sector,
    COUNT(*) AS Total_Records,
    COUNT(DISTINCT [Company_Name]) AS Total_Companies
FROM tata_group_stock_cleaned
GROUP BY Sector
ORDER BY Total_Companies DESC;

--Q5  Date Range per Company
SELECT
    [Company_Name],
    MIN([Date]) AS Start_Date,
    MAX([Date]) AS End_Date,
    COUNT(*) AS Trading_Days
FROM tata_group_stock_cleaned
GROUP BY [Company_Name]
ORDER BY [Company_Name];