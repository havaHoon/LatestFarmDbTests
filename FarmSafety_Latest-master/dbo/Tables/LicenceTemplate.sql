CREATE TABLE [dbo].[LicenceTemplate] (
    [Id]            BIGINT NOT NULL,
    [LicencePeriod] INT    NOT NULL,
    CONSTRAINT [PK_onside.LicenceTemplate] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_onside.LicenceTemplate_onside.LicenceEntity_Id] FOREIGN KEY ([Id]) REFERENCES [dbo].[LicenceEntity] ([Id])
);


GO
CREATE NONCLUSTERED INDEX [IX_Id]
    ON [dbo].[LicenceTemplate]([Id] ASC);

