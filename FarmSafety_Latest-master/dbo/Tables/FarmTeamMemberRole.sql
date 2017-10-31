CREATE TABLE [dbo].[FarmTeamMemberRole] (
    [Id] BIGINT NOT NULL,
    CONSTRAINT [PK_onside.FarmTeamMemberRole] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_onside.FarmTeamMemberRole_onside.UserRole_Id] FOREIGN KEY ([Id]) REFERENCES [dbo].[UserRole] ([Id])
);


GO
CREATE NONCLUSTERED INDEX [IX_Id]
    ON [dbo].[FarmTeamMemberRole]([Id] ASC);

