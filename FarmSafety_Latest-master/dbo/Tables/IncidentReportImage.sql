CREATE TABLE [dbo].[IncidentReportImage] (
    [Id]                    BIGINT NOT NULL,
    [IncidentReportEventId] BIGINT NULL,
    CONSTRAINT [PK_onside.IncidentReportImage] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_onside.IncidentReportImage_onside.ImageEntity_Id] FOREIGN KEY ([Id]) REFERENCES [dbo].[ImageEntity] ([Id]),
    CONSTRAINT [FK_onside.IncidentReportImage_onside.IncidentReportEvent_IncidentReportEventId] FOREIGN KEY ([IncidentReportEventId]) REFERENCES [dbo].[IncidentReportEvent] ([Id])
);


GO
CREATE NONCLUSTERED INDEX [IX_Id]
    ON [dbo].[IncidentReportImage]([Id] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_IncidentReportEventId]
    ON [dbo].[IncidentReportImage]([IncidentReportEventId] ASC);

