CREATE TABLE [dbo].[BusinessImage] (
    [Id]                BIGINT NOT NULL,
    [BusinessProfileId] BIGINT NULL,
    CONSTRAINT [PK_onside.BusinessImage] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_onside.BusinessImage_onside.BusinessProfile_BusinessProfileId] FOREIGN KEY ([BusinessProfileId]) REFERENCES [dbo].[BusinessProfile] ([Id]),
    CONSTRAINT [FK_onside.BusinessImage_onside.ImageEntity_Id] FOREIGN KEY ([Id]) REFERENCES [dbo].[ImageEntity] ([Id])
);


GO
CREATE NONCLUSTERED INDEX [IX_Id]
    ON [dbo].[BusinessImage]([Id] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_BusinessProfileId]
    ON [dbo].[BusinessImage]([BusinessProfileId] ASC);

