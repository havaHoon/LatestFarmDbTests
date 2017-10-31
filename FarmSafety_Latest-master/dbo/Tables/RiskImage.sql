CREATE TABLE [dbo].[RiskImage] (
    [Id]     BIGINT NOT NULL,
    [RiskId] BIGINT NULL,
    CONSTRAINT [PK_onside.RiskImage] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_onside.RiskImage_onside.ImageEntity_Id] FOREIGN KEY ([Id]) REFERENCES [dbo].[ImageEntity] ([Id]),
    CONSTRAINT [FK_onside.RiskImage_onside.Risk_RiskId] FOREIGN KEY ([RiskId]) REFERENCES [dbo].[Risk] ([Id])
);


GO
CREATE NONCLUSTERED INDEX [IX_Id]
    ON [dbo].[RiskImage]([Id] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_RiskId]
    ON [dbo].[RiskImage]([RiskId] ASC);

