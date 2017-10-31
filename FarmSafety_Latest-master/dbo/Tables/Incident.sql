CREATE TABLE [dbo].[Incident] (
    [Id]                               BIGINT            IDENTITY (1, 1) NOT NULL,
    [Description]                      NVARCHAR (200)    NULL,
    [FarmId]                           BIGINT            NOT NULL,
    [CreatedUtc]                       DATETIME2 (7)     NOT NULL,
    [LastModifiedUtc]                  DATETIME2 (7)     NOT NULL,
    [RowVersion]                       ROWVERSION        NOT NULL,
    [HoursAtWork]                      INT               DEFAULT ((0)) NOT NULL,
    [HowSerious]                       INT               DEFAULT ((0)) NOT NULL,
    [IncidentType]                     INT               DEFAULT ((0)) NOT NULL,
    [InjuryType]                       INT               DEFAULT ((0)) NOT NULL,
    [IsNotificationRequiredToWorksafe] BIT               DEFAULT ((0)) NOT NULL,
    [IsRiskOnRegister]                 BIT               DEFAULT ((0)) NOT NULL,
    [IsSignificantRisk]                BIT               DEFAULT ((0)) NOT NULL,
    [LocationOnBody]                   INT               DEFAULT ((0)) NOT NULL,
    [LocationOnFarm]                   INT               DEFAULT ((0)) NOT NULL,
    [NeedsAssessment]                  INT               DEFAULT ((0)) NOT NULL,
    [PersonEmploymentStatus]           INT               DEFAULT ((0)) NOT NULL,
    [PersonFirstName]                  NVARCHAR (50)     DEFAULT ('') NOT NULL,
    [PersonLastName]                   NVARCHAR (50)     DEFAULT ('') NOT NULL,
    [PersonPhoneNumber]                NVARCHAR (25)     NULL,
    [ExpectedReturnToFullDutiesDate]   DATETIME2 (7)     NULL,
    [IncidentOccurredUtc]              DATETIME2 (7)     DEFAULT ('1900-01-01T00:00:00.000') NOT NULL,
    [Location]                         [sys].[geography] NULL,
    [ReviewedUtc]                      DATETIME2 (7)     NULL,
    CONSTRAINT [PK_onside.Incident] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_onside.Incident_onside.Farm_FarmId] FOREIGN KEY ([FarmId]) REFERENCES [dbo].[Farm] ([Id])
);


GO
CREATE NONCLUSTERED INDEX [IX_Incident_FarmId]
    ON [dbo].[Incident]([FarmId] ASC);

