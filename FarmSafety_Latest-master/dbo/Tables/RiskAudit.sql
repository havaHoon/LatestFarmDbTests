CREATE TABLE [dbo].[RiskAudit] (
    [Id]     BIGINT NOT NULL,
    [RiskId] BIGINT NOT NULL,
    CONSTRAINT [PK_onside.RiskAudit] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_onside.RiskAudit_onside.ModelEntityAudit_Id] FOREIGN KEY ([Id]) REFERENCES [dbo].[ModelEntityAudit] ([Id]),
    CONSTRAINT [FK_onside.RiskAudit_onside.Risk_RiskId] FOREIGN KEY ([RiskId]) REFERENCES [dbo].[Risk] ([Id])
);


GO
CREATE NONCLUSTERED INDEX [IX_Id]
    ON [dbo].[RiskAudit]([Id] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_RiskAudit_RiskId]
    ON [dbo].[RiskAudit]([RiskId] ASC);

