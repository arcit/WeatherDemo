CREATE VIEW [dm].[FactHistoricalWeather] AS 
SELECT 
	hw.[City]
,	hw.[Date]
,	CAST(JSON_VALUE(hw.JsonData,'$.data.weather[0].maxtempC') AS decimal(4,1))	AS MaxDailyTempC
,	CAST(JSON_VALUE(hw.JsonData,'$.data.weather[0].mintempC') AS decimal(4,1))		AS MinDailyTempC
,	CAST(JSON_VALUE(hw.JsonData,'$.data.weather[0].totalSnow_cm') AS decimal(6,1))	AS TotalSnowCm
,	CAST(JSON_VALUE(hw.JsonData,'$.data.weather[0].sunHour') AS decimal(4,1))			AS SunnyHours
,	CAST(JSON_VALUE(hw.JsonData,'$.data.weather[0].uvIndex') AS decimal(4,1))			AS AvgDailyUVIndex
,	TIMEFROMPARTS(REPLACE(JSON_VALUE(a.value,'$.time'),'00',''),0,0,0,0)				AS TimeOfObservation
,	CAST(JSON_VALUE(a.value,'$.tempC') AS decimal(4,1))								AS TempreratureC
,	CAST(JSON_VALUE(a.value,'$.FeelsLikeC')	 AS decimal(4,1))						AS FeelsLikeC
,	CAST(JSON_VALUE(a.value,'$.windspeedKmph')	AS decimal(6,1))					AS WindspeedKmph
,	CAST(JSON_VALUE(a.value,'$.winddirDegree')	AS decimal(4,1))					AS WinddirDegree
,	CAST(JSON_VALUE(a.value,'$.winddir16Point')	AS varchar(3))					AS Winddir16Point
,	CAST(JSON_VALUE(a.value,'$.weatherIconUrl[0].value') AS varchar(500))				AS WeatherIconUrl
,	CAST(JSON_VALUE(a.value,'$.weatherDesc[0].value')	AS varchar(50))			AS WeatherDescription
,	CAST(JSON_VALUE(a.value,'$.humidity') AS decimal(4,1))							AS Humidity
,	CAST(JSON_VALUE(a.value,'$.pressure')	AS decimal(6,1))						AS Pressure
,	CAST(JSON_VALUE(a.value,'$.cloudcover')/100.0	AS decimal(3,2)) 						AS CloudcoverPct
FROM ods.wwoHistoricalWeather hw
CROSS APPLY OPENJSON(hw.JsonData, '$.data.weather[0].hourly') a