CREATE TABLE [dbo].[BusinessTeamMemberRole] (
    [Id] BIGINT NOT NULL,
    CONSTRAINT [PK_onside.BusinessTeamMemberRole] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_onside.BusinessTeamMemberRole_onside.UserRole_Id] FOREIGN KEY ([Id]) REFERENCES [dbo].[UserRole] ([Id])
);


GO
CREATE NONCLUSTERED INDEX [IX_Id]
    ON [dbo].[BusinessTeamMemberRole]([Id] ASC);

