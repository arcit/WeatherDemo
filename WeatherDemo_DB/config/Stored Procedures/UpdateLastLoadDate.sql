

CREATE PROCEDURE [config].[UpdateLastLoadDate]
	@UniqueObjectName varchar(250)
,	@Value datetime
AS
BEGIN
	SET XACT_ABORT, NOCOUNT ON
	BEGIN TRY
	IF @Value is not null
		BEGIN
		UPDATE [config].[ETLObjectLoadParams]
		SET [ParameterValue]=CAST(@Value as datetime)
		WHERE 1=1
		AND [UniqueObjectName]=@UniqueObjectName
		AND [ParameterName]='LastLoadDateTime'
	END
	END TRY
	BEGIN CATCH
		IF @@trancount > 0 ROLLBACK TRANSACTION;
		THROW
		RETURN 99999
	END CATCH
END