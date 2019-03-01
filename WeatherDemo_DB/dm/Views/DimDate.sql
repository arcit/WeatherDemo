  CREATE VIEW [dm].[DimDate] AS
  SELECT 
		[Date]          
		,[Year]          
		,[Month]         
		,[Day]
		,[Week]
		,[Weekday]
		,[WeekdayName]
		,[WeekDescrption]
		,[Quarter]       
		,[QuarterName]   
		,[MonthName]     
		,[MonthYear]     
		,[MonthDate]
		FROM [dbo].[Time]
		WHERE [Date] IN (SELECT [Date] FROM ods.wwoHistoricalWeather)
		UNION ALL
		SELECT '1900-01-01', -1,-1,-1,-1,-1,'NO DATA','NO DATA',-1,'NO DATA','NO DATA','NO DATA','1900-01-01' -- Surrogate row / No-data row