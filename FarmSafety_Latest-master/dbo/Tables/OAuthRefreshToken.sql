CREATE TABLE [dbo].[OAuthRefreshToken] (
    [Id]              BIGINT         IDENTITY (1, 1) NOT NULL,
    [Subject]         NVARCHAR (50)  NOT NULL,
    [TokenId]         NVARCHAR (100) NOT NULL,
    [ClientId]        NVARCHAR (50)  NOT NULL,
    [IssuedUtc]       DATETIME2 (7)  NOT NULL,
    [ExpiresUtc]      DATETIME2 (7)  NOT NULL,
    [ProtectedTicket] NVARCHAR (MAX) NOT NULL,
    [CreatedUtc]      DATETIME2 (7)  NOT NULL,
    [LastModifiedUtc] DATETIME2 (7)  NOT NULL,
    [RowVersion]      ROWVERSION     NOT NULL,
    CONSTRAINT [PK_onside.OAuthRefreshToken] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [UX_OAuthRefreshToken_Subject_ClientId]
    ON [dbo].[OAuthRefreshToken]([Subject] ASC, [ClientId] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [UX_OAuthRefreshToken_TokenId]
    ON [dbo].[OAuthRefreshToken]([TokenId] ASC);

