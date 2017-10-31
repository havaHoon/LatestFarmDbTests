CREATE TABLE [dbo].[IncidentMitigation] (
    [Id]              BIGINT         IDENTITY (1, 1) NOT NULL,
    [Description]     NVARCHAR (100) NOT NULL,
    [IncidentId]      BIGINT         NOT NULL,
    [SortOrder]       INT            NOT NULL,
    [CreatedUtc]      DATETIME2 (7)  NOT NULL,
    [LastModifiedUtc] DATETIME2 (7)  NOT NULL,
    [RowVersion]      ROWVERSION     NOT NULL,
    CONSTRAINT [PK_onside.IncidentMitigation] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_onside.IncidentMitigation_onside.Incident_IncidentId] FOREIGN KEY ([IncidentId]) REFERENCES [dbo].[Incident] ([Id])
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [UX_IncidentMitigation_IncidentId_SortOrder]
    ON [dbo].[IncidentMitigation]([IncidentId] ASC, [SortOrder] ASC);

