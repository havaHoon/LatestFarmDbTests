CREATE TABLE [dbo].[SignInEvent] (
    [Id]                     BIGINT        NOT NULL,
    [RepresentingBusinessId] BIGINT        NULL,
    [RepresentingFarmId]     BIGINT        NULL,
    [UserRoleType]           INT           NOT NULL,
    [SignOutId]              BIGINT        NULL,
    [NextSignInAnyFarmUtc]   DATETIME2 (7) NULL,
    CONSTRAINT [PK_onside.SignInEvent] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_onside.SignInEvent_onside.Business_RepresentingBusinessId] FOREIGN KEY ([RepresentingBusinessId]) REFERENCES [dbo].[Business] ([Id]),
    CONSTRAINT [FK_onside.SignInEvent_onside.Farm_RepresentingFarmId] FOREIGN KEY ([RepresentingFarmId]) REFERENCES [dbo].[Farm] ([Id]),
    CONSTRAINT [FK_onside.SignInEvent_onside.FarmEvent_Id] FOREIGN KEY ([Id]) REFERENCES [dbo].[FarmEvent] ([Id]),
    CONSTRAINT [FK_onside.SignInEvent_onside.SignOutEvent_SignOutId] FOREIGN KEY ([SignOutId]) REFERENCES [dbo].[SignOutEvent] ([Id])
);


GO
CREATE NONCLUSTERED INDEX [IX_Id]
    ON [dbo].[SignInEvent]([Id] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_RepresentingBusinessId]
    ON [dbo].[SignInEvent]([RepresentingBusinessId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_RepresentingFarmId]
    ON [dbo].[SignInEvent]([RepresentingFarmId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_SignOutId]
    ON [dbo].[SignInEvent]([SignOutId] ASC);

