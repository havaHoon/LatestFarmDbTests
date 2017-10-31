CREATE TABLE [dbo].[RiskTemplateFarmType] (
    [Id]              BIGINT        IDENTITY (1, 1) NOT NULL,
    [FarmType]        INT           NOT NULL,
    [CreatedUtc]      DATETIME2 (7) NOT NULL,
    [LastModifiedUtc] DATETIME2 (7) NOT NULL,
    [RowVersion]      ROWVERSION    NOT NULL,
    CONSTRAINT [PK_onside.RiskTemplateFarmType] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [UX_RiskTemplateFarmType_FarmType]
    ON [dbo].[RiskTemplateFarmType]([FarmType] ASC);

