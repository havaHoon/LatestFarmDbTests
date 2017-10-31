CREATE TABLE [dbo].[ExitFarmEvent] (
    [Id] BIGINT NOT NULL,
    CONSTRAINT [PK_onside.ExitFarmEvent] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_onside.ExitFarmEvent_onside.FarmEvent_Id] FOREIGN KEY ([Id]) REFERENCES [dbo].[FarmEvent] ([Id])
);


GO
CREATE NONCLUSTERED INDEX [IX_Id]
    ON [dbo].[ExitFarmEvent]([Id] ASC);

