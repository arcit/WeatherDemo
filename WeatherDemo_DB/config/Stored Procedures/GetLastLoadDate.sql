CREATE PROCEDURE [config].[GetLastLoadDate]
	@UniqueObjectName varchar(250)
AS
BEGIN
	SET XACT_ABORT, NOCOUNT ON
	BEGIN TRY
		DECLARE @LastLoadDateTime varchar(50)

		SET @LastLoadDateTime=
		(SELECT TOP 1 [ParameterValue] FROM 
		[config].[ETLObjectLoadParams]
		WHERE 1=1
		AND [UniqueObjectName]=@UniqueObjectName
		AND [ParameterName]='LastLoadDateTime')

		IF @LastLoadDateTime is not null
		BEGIN
			SELECT @LastLoadDateTime AS LastLoadDateTime
		END
		ELSE THROW 51111, 'Cannot find LastLoadDateTime for specified object name', 1
	
	END TRY
	BEGIN CATCH
		IF @@trancount > 0 ROLLBACK TRANSACTION;
		THROW
		RETURN 99999
	END CATCH
END