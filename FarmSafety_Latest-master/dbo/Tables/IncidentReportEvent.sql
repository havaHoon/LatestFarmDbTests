CREATE TABLE [dbo].[IncidentReportEvent] (
    [Id]                     BIGINT         NOT NULL,
    [IncidentType]           INT            NOT NULL,
    [IncidentId]             BIGINT         NULL,
    [Description]            NVARCHAR (200) NULL,
    [HoursAtWork]            INT            DEFAULT ((0)) NOT NULL,
    [HowSerious]             INT            DEFAULT ((0)) NOT NULL,
    [InjuryType]             INT            DEFAULT ((0)) NOT NULL,
    [LocationOnBody]         INT            DEFAULT ((0)) NOT NULL,
    [LocationOnFarm]         INT            DEFAULT ((0)) NOT NULL,
    [PersonEmploymentStatus] INT            DEFAULT ((0)) NOT NULL,
    [PersonFirstName]        NVARCHAR (50)  DEFAULT ('') NOT NULL,
    [PersonLastName]         NVARCHAR (50)  DEFAULT ('') NOT NULL,
    [PersonPhoneNumber]      NVARCHAR (25)  NULL,
    CONSTRAINT [PK_onside.IncidentReportEvent] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_onside.IncidentReportEvent_onside.FarmEvent_Id] FOREIGN KEY ([Id]) REFERENCES [dbo].[FarmEvent] ([Id]),
    CONSTRAINT [FK_onside.IncidentReportEvent_onside.Incident_IncidentId] FOREIGN KEY ([IncidentId]) REFERENCES [dbo].[Incident] ([Id])
);


GO
CREATE NONCLUSTERED INDEX [IX_Id]
    ON [dbo].[IncidentReportEvent]([Id] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_IncidentId]
    ON [dbo].[IncidentReportEvent]([IncidentId] ASC);

