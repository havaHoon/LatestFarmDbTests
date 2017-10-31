CREATE TABLE [dbo].[FarmEmergencyLocation] (
    [Id]              BIGINT            IDENTITY (1, 1) NOT NULL,
    [EmergencyPlanId] BIGINT            NOT NULL,
    [Location]        [sys].[geography] NOT NULL,
    [Type]            INT               NOT NULL,
    [CreatedUtc]      DATETIME2 (7)     NOT NULL,
    [LastModifiedUtc] DATETIME2 (7)     NOT NULL,
    [RowVersion]      ROWVERSION        NOT NULL,
    CONSTRAINT [PK_onside.FarmEmergencyLocation] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_onside.FarmEmergencyLocation_onside.FarmEmergencyPlan_EmergencyPlanId] FOREIGN KEY ([EmergencyPlanId]) REFERENCES [dbo].[FarmEmergencyPlan] ([Id])
);


GO
CREATE NONCLUSTERED INDEX [IX_EmergencyPlanId]
    ON [dbo].[FarmEmergencyLocation]([EmergencyPlanId] ASC);

