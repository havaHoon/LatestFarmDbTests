CREATE TABLE [dbo].[ImageEntity] (
    [Id]              BIGINT         IDENTITY (1, 1) NOT NULL,
    [CapturedUtc]     DATETIME2 (7)  NULL,
    [ImagePathLarge]  NVARCHAR (200) NULL,
    [ImagePathSmall]  NVARCHAR (200) NULL,
    [ImageType]       INT            NOT NULL,
    [CreatedUtc]      DATETIME2 (7)  NOT NULL,
    [LastModifiedUtc] DATETIME2 (7)  NOT NULL,
    [RowVersion]      ROWVERSION     NOT NULL,
    [DeletedUtc]      DATETIME2 (7)  NULL,
    [Sequence]        INT            DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_onside.ImageEntity] PRIMARY KEY CLUSTERED ([Id] ASC)
);

