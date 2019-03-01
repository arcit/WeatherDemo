CREATE TABLE [ods].[wwoHistoricalWeather] (
    [Date]     DATE           NOT NULL,
    [City]     NVARCHAR (100) NOT NULL,
    [JsonData] VARCHAR (MAX)  NOT NULL, 
    CONSTRAINT [PK_wwoHistoricalWeather] PRIMARY KEY ([Date],[City])
);

