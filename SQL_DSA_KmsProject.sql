CREATE DATABASE DSA_kms_project;

CREATE TABLE KMS_Data (
    [Row ID] INT,
    [Order ID] INT,
    [Order Date] DATE,
    [Order Priority] VARCHAR(20),
    [Order Quantity] INT,
    [Sales] FLOAT,
    [Discount] FLOAT,
    [Ship Mode] VARCHAR(50),
    [Profit] FLOAT,
    [Unit Price] FLOAT,
    [Shipping Cost] FLOAT,
    [Customer Name] VARCHAR(100),
    [Province] VARCHAR(100),
    [Region] VARCHAR(100),
    [Customer Segment] VARCHAR(50),
    [Product Category] VARCHAR(50),
    [Product Sub-Category] VARCHAR(100),
    [Product Name] VARCHAR(200),
    [Product Container] VARCHAR(50),
    [Product Base Margin] FLOAT,
    [Ship Date] DATE
);
select * from KMS_Data

-----Question1----
SELECT 
    YEAR([Order_Date]) AS Sales_Year,
    SUM(Sales) AS Total_Sales
FROM 
    [dbo].[KMS_Data]
WHERE 
    [Order_Date] IS NOT NULL
GROUP BY 
    YEAR([Order_Date])
ORDER BY 
    Sales_Year;

    -----Question1----

SELECT TOP 1 
    [Product_Category], 
    SUM([Sales]) AS Total_Sales
FROM 
    KMS_Data
GROUP BY 
    [Product_Category]
ORDER BY 
    Total_Sales DESC;

    ---QUESTION 2----
SELECT TOP 3
    Region,
    SUM(Sales) AS Total_Sales
FROM 
    [dbo].[KMS_Data]
WHERE 
    Region IS NOT NULL
GROUP BY 
    Region
ORDER BY 
    Total_Sales DESC;

   ----QUESTION3--

SELECT 
    SUM(Sales) AS Total_Appliance_Sales_Ontario
FROM 
    [dbo].[KMS_Data]
WHERE 
    Product_sub_Category = 'Appliances'
    AND Province = 'Ontario'

    ----Question 4------

    SELECT TOP 10
    Customer_name,
    SUM(Sales) AS Total_Sales
FROM 
    [dbo].[KMS_Data]
WHERE 
    Customer_name IS NOT NULL
GROUP BY 
    Customer_name
ORDER BY 
    Total_Sales ASC;

    SELECT 
    Customer_Name,
    Product_Category,
    SUM(Sales) AS Total_Spent
FROM 
    [dbo].[KMS_Data]
WHERE 
    Customer_Name IN (
        SELECT TOP 10 Customer_Name
        FROM [dbo].[KMS_Data]
        WHERE Customer_Name IS NOT NULL
        GROUP BY Customer_Name
        ORDER BY SUM(Sales) ASC
    )
GROUP BY 
    Customer_Name, Product_Category
ORDER BY 
    Customer_Name, Total_Spent DESC;


    ----QUESTION 5----
    SELECT TOP 1 
    [Ship_Mode], 
    SUM([Shipping_Cost]) AS Total_Shipping_Cost
FROM 
    KMS_Data
GROUP BY 
    [Ship_Mode]
ORDER BY 
    Total_Shipping_Cost DESC;

    ---OR---
    SELECT TOP 1 * 
FROM [dbo].[KMS_Data];


SELECT 
    [Ship_Mode], 
    SUM(Shipping_Cost) AS Total_Shipping_Cost
FROM 
    [dbo].[KMS_Data]
WHERE 
    Ship_Mode IS NOT NULL
GROUP BY 
    [Ship_Mode]
ORDER BY 
    Total_Shipping_Cost DESC;

    ---Question 6---

    SELECT TOP 10 
    [Customer_Name],
    SUM([Sales]) AS Total_Sales,
    COUNT([Order_ID]) AS Total_Orders,
    AVG([Sales]) AS Avg_Order_Value
FROM 
    KMS_Data
GROUP BY 
    [Customer_Name]
ORDER BY 
    Total_Sales DESC;
    
---0R--

SELECT TOP 10
    Customer_Name,
    SUM(Sales) AS Total_Spent
FROM 
    [dbo].[KMS_Data]
WHERE 
    Customer_Name IS NOT NULL
GROUP BY 
    Customer_Name
ORDER BY 
    Total_Spent DESC;


    SELECT 
    Customer_Name,
    Product_Name,
    SUM(Sales) AS Product_Spent
FROM 
    [dbo].[KMS_Data]
WHERE 
    Customer_Name IN (
        SELECT TOP 10 Customer_Name
        FROM [dbo].[KMS_Data]
        GROUP BY Customer_Name
        ORDER BY SUM(Sales) DESC
    )
GROUP BY 
    Customer_Name, Product_Name
ORDER BY 
    Customer_Name, Product_Spent DESC;

    ---Question 7---

SELECT TOP 1 
    [Customer_Name],
    SUM([Sales]) AS Total_Sales
FROM 
    KMS_Data
WHERE 
    [Customer_Segment] = 'Small Business'
GROUP BY 
    [Customer_Name]
ORDER BY 
    Total_Sales DESC;

    --Question 8---

SELECT TOP 1
    Customer_Name,
    COUNT(*) AS Order_Count
FROM 
    [dbo].[KMS_Data]
WHERE 
    Customer_Segment = 'Corporate'
    AND [Order_Date] BETWEEN '2009-01-01' AND '2021-12-31'
GROUP BY 
    Customer_Name
ORDER BY 
    Order_Count DESC;
    --OR----
   SELECT TOP 1 
    [Customer_Name],
    COUNT([Order_ID]) AS Total_Orders
FROM 
    KMS_Data
WHERE 
    [Customer_Segment] = 'Corporate'
    AND [Order_Date] BETWEEN '2009-01-01' AND '2012-12-31'
GROUP BY 
    [Customer_Name]
ORDER BY 
    Total_Orders DESC;

    --Question 9---

SELECT TOP 1
    Customer_Name,
    SUM(Profit) AS Total_Profit
FROM 
    [dbo].[KMS_Data]
WHERE 
    Customer_Segment = 'Consumer'
GROUP BY 
    Customer_Name
ORDER BY 
    Total_Profit DESC;

    ---Question 10---

SELECT DISTINCT
    Customer_Name,
    Customer_Segment,
    SUM(Profit) AS Total_Profit
FROM 
    [dbo].[KMS_Data]
GROUP BY 
    Customer_Name, Customer_Segment
HAVING 
    SUM(Profit) < 0
ORDER BY 
    Total_Profit;

    ---Question 11----

SELECT TOP 5 * 
FROM [dbo].[KMS_Data];

SELECT 
    Order_Priority,
    Ship_Mode,
    COUNT(*) AS Num_Orders,
    SUM(Sales) AS Total_Sales,
    SUM(Shipping_Cost) AS Total_Shipping_Cost
FROM 
    [dbo].[KMS_Data]
GROUP BY 
    Order_Priority, Ship_Mode
ORDER BY 
    Order_Priority, Ship_Mode;



   select * from KMS_Data
