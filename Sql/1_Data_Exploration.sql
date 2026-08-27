-- 1. view sample data

SELECT TOP 10 *
FROM tata_group_stock_cleaned;


-- 2. total records

SELECT 
    COUNT(*) AS Total_Records
FROM tata_group_stock_cleaned;


-- 3. total companies

SELECT 
    COUNT(DISTINCT [Company_Name]) AS Total_Companies
FROM tata_group_stock_cleaned;


-- 4. total sectors

SELECT 
    COUNT(DISTINCT Sector) AS Total_Sectors
FROM tata_group_stock_cleaned;


-- 5. date range

SELECT 
    MIN(Date) AS Start_Date,
    MAX(Date) AS End_Date
FROM tata_group_stock_cleaned;


-- 6. company list

SELECT DISTINCT
    [Company_Name],
    [NSE_Symbol],
    [BSE_Code],
    Sector
FROM tata_group_stock_cleaned
ORDER BY [Company_Name];


-- 7. records by company

SELECT
    [Company_Name],
    COUNT(*) AS Total_Records
FROM tata_group_stock_cleaned
GROUP BY [Company_Name]
ORDER BY Total_Records DESC;


-- 8. records by sector

SELECT
    Sector,
    COUNT(*) AS Total_Records,
    COUNT(DISTINCT [Company_Name]) AS Total_Companies
FROM tata_group_stock_cleaned
GROUP BY Sector
ORDER BY Total_Records DESC;

-- 10. duplicate records

SELECT
    [Company_Name],
    Date,
    COUNT(*) AS Duplicate_Count
FROM tata_group_stock_cleaned
GROUP BY
    [Company_Name],
    Date
HAVING COUNT(*) > 1;


-- 11. records date by company

SELECT
    [Company_Name],
    MIN(Date) AS First_Record_Date,
    MAX(Date) AS Last_Record_Date,
    COUNT(*) AS Total_Days
FROM tata_group_stock_cleaned
GROUP BY [Company_Name]
ORDER BY [Company_Name];

-- 12. year wise records

SELECT
    Year,
    COUNT(*) AS Total_Records,
    COUNT(DISTINCT [Company_Name]) AS Total_Companies
FROM tata_group_stock_cleaned
GROUP BY Year
ORDER BY Year;


-- 13. quarter wise records

SELECT
    Year,
    Quarter,
    COUNT(*) AS Total_Records
FROM tata_group_stock_cleaned
GROUP BY
    Year,
    Quarter
ORDER BY
    Year,
    Quarter;


