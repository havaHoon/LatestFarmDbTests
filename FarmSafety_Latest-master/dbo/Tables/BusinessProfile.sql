CREATE TABLE [dbo].[BusinessProfile] (
    [Id]              BIGINT         NOT NULL,
    [Address]         NVARCHAR (256) NOT NULL,
    [Description]     NVARCHAR (500) NULL,
    [Name]            NVARCHAR (100) NOT NULL,
    [CreatedUtc]      DATETIME2 (7)  NOT NULL,
    [LastModifiedUtc] DATETIME2 (7)  NOT NULL,
    [RowVersion]      ROWVERSION     NOT NULL,
    CONSTRAINT [PK_onside.BusinessProfile] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_onside.BusinessProfile_onside.Business_Id] FOREIGN KEY ([Id]) REFERENCES [dbo].[Business] ([Id])
);


GO
CREATE NONCLUSTERED INDEX [IX_Id]
    ON [dbo].[BusinessProfile]([Id] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_BusinessProfile_Address]
    ON [dbo].[BusinessProfile]([Address] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [UX_BusinessProfile_Name]
    ON [dbo].[BusinessProfile]([Name] ASC);

