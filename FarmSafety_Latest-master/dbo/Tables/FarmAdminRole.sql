CREATE TABLE [dbo].[FarmAdminRole] (
    [Id]             BIGINT        NOT NULL,
    [TrialExpiryUtc] DATETIME2 (7) NULL,
    CONSTRAINT [PK_onside.FarmAdminRole] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_onside.FarmAdminRole_onside.UserRole_Id] FOREIGN KEY ([Id]) REFERENCES [dbo].[UserRole] ([Id])
);


GO
CREATE NONCLUSTERED INDEX [IX_Id]
    ON [dbo].[FarmAdminRole]([Id] ASC);

