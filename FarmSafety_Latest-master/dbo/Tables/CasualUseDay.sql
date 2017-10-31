CREATE TABLE [dbo].[CasualUseDay] (
    [Id]               BIGINT        IDENTITY (1, 1) NOT NULL,
    [Date]             DATETIME2 (7) NOT NULL,
    [RecreationRoleId] BIGINT        NOT NULL,
    [CreatedUtc]       DATETIME2 (7) NOT NULL,
    [LastModifiedUtc]  DATETIME2 (7) NOT NULL,
    [RowVersion]       ROWVERSION    NOT NULL,
    CONSTRAINT [PK_onside.CasualUseDay] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_onside.CasualUseDay_onside.RecreationRole_RecreationRoleId] FOREIGN KEY ([RecreationRoleId]) REFERENCES [dbo].[RecreationRole] ([Id])
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [UX_CasualUseDay_RecreationRoleId_Date]
    ON [dbo].[CasualUseDay]([RecreationRoleId] ASC, [Date] ASC);

