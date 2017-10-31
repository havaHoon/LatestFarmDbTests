CREATE TABLE [dbo].[AlertEvent] (
    [Id]                   BIGINT         NOT NULL,
    [Reason]               BIGINT            NOT NULL,
    [Text]                 NVARCHAR (MAX) NULL,
    [ExitFarmId]           BIGINT         NULL,
    [SignInId]             BIGINT         NULL,
    [NextSignInAnyFarmUtc] DATETIME2 (7)  NULL,
    [NextAlertAnyFarmUtc]  DATETIME2 (7)  NULL,
    CONSTRAINT [PK_onside.AlertEvent] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_onside.AlertEvent_onside.ExitFarmEvent_ExitFarmId] FOREIGN KEY ([ExitFarmId]) REFERENCES [dbo].[ExitFarmEvent] ([Id]),
    CONSTRAINT [FK_onside.AlertEvent_onside.FarmEvent_Id] FOREIGN KEY ([Id]) REFERENCES [dbo].[FarmEvent] ([Id]),
    CONSTRAINT [FK_onside.AlertEvent_onside.SignInEvent_SignInId] FOREIGN KEY ([SignInId]) REFERENCES [dbo].[SignInEvent] ([Id])
);


GO
CREATE NONCLUSTERED INDEX [IX_Id]
    ON [dbo].[AlertEvent]([Id] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_ExitFarmId]
    ON [dbo].[AlertEvent]([ExitFarmId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_SignInId]
    ON [dbo].[AlertEvent]([SignInId] ASC);

