CREATE TABLE [dbo].[FarmImage] (
    [Id]            BIGINT NOT NULL,
    [FarmProfileId] BIGINT NULL,
    CONSTRAINT [PK_onside.FarmImage] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_onside.FarmImage_onside.FarmProfile_FarmProfileId] FOREIGN KEY ([FarmProfileId]) REFERENCES [dbo].[FarmProfile] ([Id]),
    CONSTRAINT [FK_onside.FarmImage_onside.ImageEntity_Id] FOREIGN KEY ([Id]) REFERENCES [dbo].[ImageEntity] ([Id])
);


GO
CREATE NONCLUSTERED INDEX [IX_Id]
    ON [dbo].[FarmImage]([Id] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_FarmProfileId]
    ON [dbo].[FarmImage]([FarmProfileId] ASC);

