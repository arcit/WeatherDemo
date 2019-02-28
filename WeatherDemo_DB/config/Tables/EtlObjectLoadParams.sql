CREATE TABLE [config].[EtlObjectLoadParams] (
    [SourceSystem]     VARCHAR (10)  NULL,
    [SourceObjectName] VARCHAR (250) NULL,
    [UniqueObjectName] VARCHAR (250) NOT NULL,
    [ParameterName]    VARCHAR (100) NOT NULL,
    [ParameterValue]   VARCHAR (500) NOT NULL
);

