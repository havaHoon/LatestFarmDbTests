CREATE TABLE [dbo].[FarmEvent] (
    [Id]              BIGINT            IDENTITY (1, 1) NOT NULL,
    [FarmId]          BIGINT            NOT NULL,
    [FarmEventType]   INT               NOT NULL,
    [CapturedUtc]     DATETIME2 (7)     NOT NULL,
    [Location]        [sys].[geography] NULL,
    [OccurredUtc]     DATETIME2 (7)     NOT NULL,
    [CreatedUtc]      DATETIME2 (7)     NOT NULL,
    [LastModifiedUtc] DATETIME2 (7)     NOT NULL,
    [RowVersion]      ROWVERSION        NOT NULL,
    [CapturingUserId] BIGINT            DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_onside.FarmEvent] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_onside.FarmEvent_onside.ApplicationUser_CapturingUserId] FOREIGN KEY ([CapturingUserId]) REFERENCES [dbo].[ApplicationUser] ([Id]),
    CONSTRAINT [FK_onside.FarmEvent_onside.Farm_FarmId] FOREIGN KEY ([FarmId]) REFERENCES [dbo].[Farm] ([Id])
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [UX_FarmEvent_FarmId_OccurredUtc_CapturingUserId_FarmEventType]
    ON [dbo].[FarmEvent]([FarmId] ASC, [OccurredUtc] ASC, [CapturingUserId] ASC, [FarmEventType] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_FarmEvent_CapturingUserId_OccurredUtc]
    ON [dbo].[FarmEvent]([CapturingUserId] ASC, [OccurredUtc] ASC);

