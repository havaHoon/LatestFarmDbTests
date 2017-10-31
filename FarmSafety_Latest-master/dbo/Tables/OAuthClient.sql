CREATE TABLE [dbo].[OAuthClient] (
    [Id]                         BIGINT         IDENTITY (1, 1) NOT NULL,
    [ClientId]                   NVARCHAR (50)  NOT NULL,
    [Secret]                     NVARCHAR (MAX) NOT NULL,
    [Active]                     BIT            NOT NULL,
    [RefreshTokenLifeTimeInMins] INT            NOT NULL,
    [CreatedUtc]                 DATETIME2 (7)  NOT NULL,
    [LastModifiedUtc]            DATETIME2 (7)  NOT NULL,
    [RowVersion]                 ROWVERSION     NOT NULL,
    CONSTRAINT [PK_onside.OAuthClient] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [UX_OAuthClient_ClientId]
    ON [dbo].[OAuthClient]([ClientId] ASC);

