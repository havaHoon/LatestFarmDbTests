CREATE TABLE [dbo].[IncidentImage] (
    [Id]         BIGINT NOT NULL,
    [IncidentId] BIGINT NULL,
    CONSTRAINT [PK_onside.IncidentImage] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_onside.IncidentImage_onside.ImageEntity_Id] FOREIGN KEY ([Id]) REFERENCES [dbo].[ImageEntity] ([Id]),
    CONSTRAINT [FK_onside.IncidentImage_onside.Incident_IncidentId] FOREIGN KEY ([IncidentId]) REFERENCES [dbo].[Incident] ([Id])
);


GO
CREATE NONCLUSTERED INDEX [IX_Id]
    ON [dbo].[IncidentImage]([Id] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_IncidentId]
    ON [dbo].[IncidentImage]([IncidentId] ASC);

