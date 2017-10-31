CREATE TABLE [dbo].[SignOutEvent] (
    [Id] BIGINT NOT NULL,
    CONSTRAINT [PK_onside.SignOutEvent] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_onside.SignOutEvent_onside.FarmEvent_Id] FOREIGN KEY ([Id]) REFERENCES [dbo].[FarmEvent] ([Id])
);


GO
CREATE NONCLUSTERED INDEX [IX_Id]
    ON [dbo].[SignOutEvent]([Id] ASC);

