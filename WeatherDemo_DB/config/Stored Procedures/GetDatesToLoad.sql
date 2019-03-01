CREATE PROCEDURE [config].[GetDatesToLoad]
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
			SELECT CONVERT(varchar(10),Date,120) as DateToLoad 
			FROM dbo.Time
			WHERE Date > DATEADD(DAY,-1,@LastLoadDateTime)
			AND Date<getdate()
		END
		ELSE THROW 51111, 'Cannot find LastLoadDateTime parameter for specified object name', 1
	
	END TRY
	BEGIN CATCH
		IF @@trancount > 0 ROLLBACK TRANSACTION;
		THROW
		RETURN 99999
	END CATCH
END