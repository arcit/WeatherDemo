CREATE PROCEDURE dbo.GetDatesByMonth
(
 @YearMonth varchar(20)
)
AS
BEGIN
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON

    -- Insert statements for procedure here
    SELECT CONVERT(varchar(10),[Date],120) as d
	FROM dbo.[Time]
	WHERE [Date]>=(@YearMonth +'-01') AND [Date]<DATEADD(MONTH,1,(@YearMonth +'-01'))
END