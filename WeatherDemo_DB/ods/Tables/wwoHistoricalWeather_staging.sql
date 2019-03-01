CREATE TABLE [ods].[wwoHistoricalWeather_staging] (
    [Date]     DATE           NOT NULL,
    [City]     NVARCHAR (100) NOT NULL,
    [JsonData] VARCHAR (MAX)  NOT NULL, 
    CONSTRAINT [PK_wwoHistoricalWeather_staging] PRIMARY KEY ([Date],[City])
);