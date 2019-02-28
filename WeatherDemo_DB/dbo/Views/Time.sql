CREATE VIEW [dbo].[Time]
AS   
SELECT 
  CAST(d as date) AS [Date]
  ,YEAR(d) AS [Year]
  ,MONTH(d) AS [Month]
  ,DAY(d) AS [Day]
  ,DATEPART(ISO_WEEK,d) [Week]
  ,DATEPART(W,d) AS [Weekday]
  ,DATENAME(WEEKDAY,d) [WeekdayName]
  ,DATEPART(QUARTER,d) AS [Quarter]
  ,'Q' + DATENAME(QUARTER,d) AS [QuarterName]
  ,DATENAME(MONTH,d) AS [MonthName]
  ,CONVERT(varchar(7),d,120) AS [MonthYear]
  ,DATEFROMPARTS(YEAR(d),MONTH(d),1) AS [MonthDate]
FROM
  (SELECT 
  DATEADD(DAY,n,'2015-01-01') as d
  FROM dbo.GetNums(0,3000)) a