CREATE TABLE [dbo].[UserToken] (
    [Id]              BIGINT         IDENTITY (1, 1) NOT NULL,
    [UserId]          BIGINT         NOT NULL,
    [TokenHash]       NVARCHAR (100) NOT NULL,
    [ExpiresOnUtc]    DATETIME2 (7)  NOT NULL,
    [Purpose]         INT            NOT NULL,
    [ReadCount]       BIGINT         NOT NULL,
    [IsOneTimeUse]    BIT            NOT NULL,
    [CreatedUtc]      DATETIME2 (7)  NOT NULL,
    [LastModifiedUtc] DATETIME2 (7)  NOT NULL,
    [RowVersion]      ROWVERSION     NOT NULL,
    CONSTRAINT [PK_onside.UserToken] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
CREATE NONCLUSTERED INDEX [IX_UserToken_UserId]
    ON [dbo].[UserToken]([UserId] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [UX_UserToken_TokenHash]
    ON [dbo].[UserToken]([TokenHash] ASC);

