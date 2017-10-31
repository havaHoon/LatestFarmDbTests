CREATE TABLE [dbo].[ApplicationUserRole] (
    [UserId] BIGINT NOT NULL,
    [RoleId] BIGINT NOT NULL,
    CONSTRAINT [PK_onside.ApplicationUserRole] PRIMARY KEY CLUSTERED ([UserId] ASC, [RoleId] ASC),
    CONSTRAINT [FK_onside.ApplicationUserRole_onside.ApplicationRole_RoleId] FOREIGN KEY ([RoleId]) REFERENCES [dbo].[ApplicationRole] ([Id]),
    CONSTRAINT [FK_onside.ApplicationUserRole_onside.ApplicationUser_UserId] FOREIGN KEY ([UserId]) REFERENCES [dbo].[ApplicationUser] ([Id])
);


GO
CREATE NONCLUSTERED INDEX [IX_UserId]
    ON [dbo].[ApplicationUserRole]([UserId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_RoleId]
    ON [dbo].[ApplicationUserRole]([RoleId] ASC);

