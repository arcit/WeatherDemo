CREATE PROCEDURE [ods].[Load_wwoHistoricalWeather]
AS
BEGIN
	SET XACT_ABORT, NOCOUNT ON
	BEGIN TRY	
		MERGE [ods].[wwoHistoricalWeather] t
		USING [ods].[wwoHistoricalWeather_staging]  s
			ON t.[Date]=s.[Date] AND t.[City]=s.[City]
		WHEN MATCHED THEN UPDATE SET
			JsonData=s.JsonData
		WHEN NOT MATCHED THEN INSERT
		([Date],[City],[JsonData])
		VALUES
		(s.[Date],s.[City],s.[JsonData]);
	END TRY
	BEGIN CATCH
		IF @@trancount > 0 ROLLBACK TRANSACTION;
		THROW
		RETURN 99999
	END CATCH
END