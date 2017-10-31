CREATE TABLE [dbo].[IncidentAudit] (
    [Id]         BIGINT NOT NULL,
    [IncidentId] BIGINT NOT NULL,
    CONSTRAINT [PK_onside.IncidentAudit] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_onside.IncidentAudit_onside.Incident_IncidentId] FOREIGN KEY ([IncidentId]) REFERENCES [dbo].[Incident] ([Id]),
    CONSTRAINT [FK_onside.IncidentAudit_onside.ModelEntityAudit_Id] FOREIGN KEY ([Id]) REFERENCES [dbo].[ModelEntityAudit] ([Id])
);


GO
CREATE NONCLUSTERED INDEX [IX_Id]
    ON [dbo].[IncidentAudit]([Id] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_IncidentAudit_IncidentId]
    ON [dbo].[IncidentAudit]([IncidentId] ASC);

