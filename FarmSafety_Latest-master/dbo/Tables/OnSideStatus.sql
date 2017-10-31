CREATE TABLE [dbo].[OnSideStatus] (
    [Id]                        BIGINT        IDENTITY (1, 1) NOT NULL,
    [BackgroundServicePulseUtc] DATETIME2 (7) NULL,
    [CreatedUtc]                DATETIME2 (7) NOT NULL,
    [LastModifiedUtc]           DATETIME2 (7) NOT NULL,
    [RowVersion]                ROWVERSION    NOT NULL,
    CONSTRAINT [PK_onside.OnSideStatus] PRIMARY KEY CLUSTERED ([Id] ASC)
);

