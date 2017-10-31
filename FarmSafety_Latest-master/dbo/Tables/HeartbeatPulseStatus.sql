CREATE TABLE [dbo].[HeartbeatPulseStatus] (
    [Id]                     BIGINT        IDENTITY (1, 1) NOT NULL,
    [HeartbeatServiceType]   INT           NOT NULL,
    [FirstFailedPulseStatus] INT           NULL,
    [NotificationSent]       BIT           NOT NULL,
    [CreatedUtc]             DATETIME2 (7) NOT NULL,
    [LastModifiedUtc]        DATETIME2 (7) NOT NULL,
    [RowVersion]             ROWVERSION    NOT NULL,
    [LastAttemptedPulse]     DATETIME2 (7) NULL,
    [FirstFailedPulse]       DATETIME2 (7) NULL,
    CONSTRAINT [PK_onside.HeartbeatPulseStatus] PRIMARY KEY CLUSTERED ([Id] ASC)
);

