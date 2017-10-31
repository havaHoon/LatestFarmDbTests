CREATE TABLE [dbo].[UserRole] (
    [Id]              BIGINT        IDENTITY (1, 1) NOT NULL,
    [UserId]          BIGINT        NOT NULL,
    [UserRoleType]    INT           NOT NULL,
    [CreatedUtc]      DATETIME2 (7) NOT NULL,
    [LastModifiedUtc] DATETIME2 (7) NOT NULL,
    [RowVersion]      ROWVERSION    NOT NULL,
    CONSTRAINT [PK_onside.UserRole] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_onside.UserRole_onside.ApplicationUser_UserId] FOREIGN KEY ([UserId]) REFERENCES [dbo].[ApplicationUser] ([Id])
);


GO
CREATE NONCLUSTERED INDEX [IX_UserId]
    ON [dbo].[UserRole]([UserId] ASC);

