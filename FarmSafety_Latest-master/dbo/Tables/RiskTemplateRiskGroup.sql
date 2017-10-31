CREATE TABLE [dbo].[RiskTemplateRiskGroup] (
    [Id]              BIGINT        IDENTITY (1, 1) NOT NULL,
    [FarmTypeId]      BIGINT        NOT NULL,
    [RiskGroup]       NVARCHAR (30) NOT NULL,
    [CreatedUtc]      DATETIME2 (7) NOT NULL,
    [LastModifiedUtc] DATETIME2 (7) NOT NULL,
    [RowVersion]      ROWVERSION    NOT NULL,
    CONSTRAINT [PK_onside.RiskTemplateRiskGroup] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_onside.RiskTemplateRiskGroup_onside.RiskTemplateFarmType_FarmTypeId] FOREIGN KEY ([FarmTypeId]) REFERENCES [dbo].[RiskTemplateFarmType] ([Id])
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [UX_RiskTemplateRiskGroup_FarmTypeId_RiskGroup]
    ON [dbo].[RiskTemplateRiskGroup]([FarmTypeId] ASC, [RiskGroup] ASC);

