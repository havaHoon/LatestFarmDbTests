CREATE TABLE [dbo].[RiskTemplateMitigation] (
    [Id]              BIGINT         IDENTITY (1, 1) NOT NULL,
    [Description]     NVARCHAR (100) NOT NULL,
    [ItemId]          BIGINT         NOT NULL,
    [SortOrder]       INT            NOT NULL,
    [CreatedUtc]      DATETIME2 (7)  NOT NULL,
    [LastModifiedUtc] DATETIME2 (7)  NOT NULL,
    [RowVersion]      ROWVERSION     NOT NULL,
    CONSTRAINT [PK_onside.RiskTemplateMitigation] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_onside.RiskTemplateMitigation_onside.RiskTemplateItem_ItemId] FOREIGN KEY ([ItemId]) REFERENCES [dbo].[RiskTemplateItem] ([Id])
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [UX_RiskTemplateMitigation_ItemId_Description]
    ON [dbo].[RiskTemplateMitigation]([ItemId] ASC, [Description] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [UX_RiskTemplateMitigation_ItemId_SortOrder]
    ON [dbo].[RiskTemplateMitigation]([ItemId] ASC, [SortOrder] ASC);

