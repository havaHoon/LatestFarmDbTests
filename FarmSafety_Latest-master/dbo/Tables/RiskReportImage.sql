CREATE TABLE [dbo].[RiskReportImage] (
    [Id]                BIGINT NOT NULL,
    [RiskReportEventId] BIGINT NULL,
    CONSTRAINT [PK_onside.RiskReportImage] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_onside.RiskReportImage_onside.ImageEntity_Id] FOREIGN KEY ([Id]) REFERENCES [dbo].[ImageEntity] ([Id]),
    CONSTRAINT [FK_onside.RiskReportImage_onside.RiskReportEvent_RiskReportEventId] FOREIGN KEY ([RiskReportEventId]) REFERENCES [dbo].[RiskReportEvent] ([Id])
);


GO
CREATE NONCLUSTERED INDEX [IX_Id]
    ON [dbo].[RiskReportImage]([Id] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_RiskReportEventId]
    ON [dbo].[RiskReportImage]([RiskReportEventId] ASC);

