CREATE TABLE [dbo].[Farm] (
    [Id]                               BIGINT        IDENTITY (1, 1) NOT NULL,
    [CreatedUtc]                       DATETIME2 (7) NOT NULL,
    [LastModifiedUtc]                  DATETIME2 (7) NOT NULL,
    [RowVersion]                       ROWVERSION    NOT NULL,
    [MobileSignificantLastModifiedUtc] DATETIME2 (7) DEFAULT ('1900-01-01T00:00:00.000') NOT NULL,
    [DeletedUtc]                       DATETIME2 (7) NULL,
    [ActivatedUtc]                     DATETIME2 (7) NULL,
    [ExpiryUtc]                        DATETIME2 (7) NULL,
    CONSTRAINT [PK_onside.Farm] PRIMARY KEY CLUSTERED ([Id] ASC)
);

