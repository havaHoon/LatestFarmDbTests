CREATE TABLE [dbo].[Business] (
    [Id]              BIGINT        IDENTITY (1, 1) NOT NULL,
    [CreatedUtc]      DATETIME2 (7) NOT NULL,
    [LastModifiedUtc] DATETIME2 (7) NOT NULL,
    [RowVersion]      ROWVERSION    NOT NULL,
    [DeletedUtc]      DATETIME2 (7) NULL,
    [ActivatedUtc]    DATETIME2 (7) NULL,
    CONSTRAINT [PK_onside.Business] PRIMARY KEY CLUSTERED ([Id] ASC)
);

