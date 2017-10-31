CREATE TABLE [dbo].[FarmAdminFarm] (
    [Id]              BIGINT        IDENTITY (1, 1) NOT NULL,
    [FarmAdminRoleId] BIGINT        NOT NULL,
    [FarmId]          BIGINT        NOT NULL,
    [CreatedUtc]      DATETIME2 (7) NOT NULL,
    [LastModifiedUtc] DATETIME2 (7) NOT NULL,
    [RowVersion]      ROWVERSION    NOT NULL,
    [JobRole]         NVARCHAR (50) NULL,
    [IsLimitedAlert]  BIT           DEFAULT ((0)) NOT NULL,
    [IsContact]       BIT           DEFAULT ((0)) NOT NULL,
    [IsBillPayer]     BIT           DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_onside.FarmAdminFarm] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_onside.FarmAdminFarm_onside.Farm_FarmId] FOREIGN KEY ([FarmId]) REFERENCES [dbo].[Farm] ([Id]),
    CONSTRAINT [FK_onside.FarmAdminFarm_onside.FarmAdminRole_FarmAdminRoleId] FOREIGN KEY ([FarmAdminRoleId]) REFERENCES [dbo].[FarmAdminRole] ([Id])
);


GO
CREATE NONCLUSTERED INDEX [IX_FarmAdminRoleId]
    ON [dbo].[FarmAdminFarm]([FarmAdminRoleId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_FarmId]
    ON [dbo].[FarmAdminFarm]([FarmId] ASC);

