  CREATE VIEW dm.DimDate AS
  SELECT 
		[Date]          
		,[Year]          
		,[Month]         
		,[Day]
		,[Week]
		,[Weekday]
		,[WeekdayName]        
		,[Quarter]       
		,[QuarterName]   
		,[MonthName]     
		,[MonthYear]     
		,[MonthDate]
		FROM [dbo].[Time]
		UNION ALL
		SELECT '1900-01-01', -1,-1,-1,-1,-1,'NO DATA',-1,'NO DATA','NO DATA','NO DATA','1900-01-01' -- Surrogate row / No-data row