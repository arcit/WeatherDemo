CREATE PROCEDURE [config].[GetAPIKey]
	@UniqueObjectName varchar(250)
AS
BEGIN
	SET XACT_ABORT, NOCOUNT ON
	BEGIN TRY
		DECLARE @APIKey varchar(100)

		SET @APIKey=
		(SELECT TOP 1 [ParameterValue] FROM 
		[config].[ETLObjectLoadParams]
		WHERE 1=1
		AND [UniqueObjectName]=@UniqueObjectName
		AND [ParameterName]='APIKey')

		IF @APIKey is not null
		BEGIN
			SELECT @APIKey AS APIKey
		END
		ELSE THROW 51111, 'Cannot find APIKey for specified object name', 1
	
	END TRY
	BEGIN CATCH
		IF @@trancount > 0 ROLLBACK TRANSACTION;
		THROW
		RETURN 99999
	END CATCH
END