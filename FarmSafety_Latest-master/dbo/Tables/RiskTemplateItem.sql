CREATE TABLE [dbo].[RiskTemplateItem] (
    [Id]              BIGINT        IDENTITY (1, 1) NOT NULL,
    [Likelihood]      INT           NOT NULL,
    [PotentialHarm]   INT           NOT NULL,
    [RiskGroupId]     BIGINT        NOT NULL,
    [SortOrder]       INT           NOT NULL,
    [Title]           NVARCHAR (75) NOT NULL,
    [Type]            INT           CONSTRAINT [DF_onside.RiskTemplateItem_Type] DEFAULT ((100)) NOT NULL,
    [CreatedUtc]      DATETIME2 (7) NOT NULL,
    [LastModifiedUtc] DATETIME2 (7) NOT NULL,
    [RowVersion]      ROWVERSION    NOT NULL,
    CONSTRAINT [PK_onside.RiskTemplateItem] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_onside.RiskTemplateItem_onside.RiskTemplateRiskGroup_RiskGroupId] FOREIGN KEY ([RiskGroupId]) REFERENCES [dbo].[RiskTemplateRiskGroup] ([Id])
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [UX_RiskTemplateItem_RiskGroupId_SortOrder]
    ON [dbo].[RiskTemplateItem]([RiskGroupId] ASC, [SortOrder] ASC);

