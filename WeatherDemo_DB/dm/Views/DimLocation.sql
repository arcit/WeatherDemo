CREATE VIEW [dm].[DimLocation] AS 
SELECT 
	[City]
,	JSON_VALUE(JsonData,'$.data.nearest_area[0].country[0].value') AS Country
,	JSON_VALUE(JsonData,'$.data.nearest_area[0].latitude') AS Latitude
,	JSON_VALUE(JsonData,'$.data.nearest_area[0].longitude') AS Longitude	
FROM ods.wwoHistoricalWeather