
CREATE VIEW [config].[EtlCities] AS
(
	SELECT CAST('Warsaw' AS varchar(100)) AS City
	UNION ALL
	SELECT CAST('Gdansk' AS varchar(100)) AS City
	UNION ALL
	SELECT CAST('Lodz' AS varchar(100)) AS City
	UNION ALL
	SELECT CAST('Wroclaw' AS varchar(100)) AS City
	UNION ALL
	SELECT CAST('Cracow' AS varchar(100)) AS City
	UNION ALL
	SELECT CAST('Poznan' AS varchar(100)) AS City
	UNION ALL
	SELECT CAST('Bydgoszcz' AS varchar(100)) AS City
	UNION ALL
	SELECT CAST('Lublin' AS varchar(100)) AS City
	UNION ALL
	SELECT CAST('Katowice' AS varchar(100)) AS City
	UNION ALL
	SELECT CAST('Bialystok' AS varchar(100)) AS City
)