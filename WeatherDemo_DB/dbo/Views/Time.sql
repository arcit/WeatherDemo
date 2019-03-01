CREATE VIEW [dbo].[Time]
AS   
SELECT 
  CAST(d as date) AS [Date]
  ,YEAR(d) AS [Year]
  ,MONTH(d) AS [Month]
  ,DAY(d) AS [Day]
  ,DATEPART(WEEK,d) [Week]
  ,DATEPART(W,d) AS [Weekday]
  ,DATENAME(WEEKDAY,d) [WeekdayName]
  ,'Week '+ CAST(DATEPART(WEEK,d)as varchar(50)) + ' (' + RIGHT(CONVERT(varchar(10),(DATEADD(WEEK, 0, DATEADD(DAY, 1-DATEPART(WEEKDAY, d), DATEDIFF(dd, 0, d))) +1),120),5) + ' - ' + RIGHT(CONVERT(varchar(10),(DATEADD(WEEK, 1, DATEADD(DAY, 0-DATEPART(WEEKDAY, d), DATEDIFF(dd, 0, d)))+1),120),5) + ')' AS WeekDescrption
  ,DATEPART(QUARTER,d) AS [Quarter]
  ,'Q' + DATENAME(QUARTER,d) AS [QuarterName]
  ,DATENAME(MONTH,d) AS [MonthName]
  ,CONVERT(varchar(7),d,120) AS [MonthYear]
  ,DATEFROMPARTS(YEAR(d),MONTH(d),1) AS [MonthDate]
FROM
  (SELECT 
  DATEADD(DAY,n,'2015-01-01') as d
  FROM dbo.GetNums(0,3000)) a