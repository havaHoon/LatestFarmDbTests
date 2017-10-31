CREATE TABLE [dbo].[Induction] (
    [Id]                   BIGINT        IDENTITY (1, 1) NOT NULL,
    [FarmId]               BIGINT        NOT NULL,
    [UserId]               BIGINT        NOT NULL,
    [CreatedUtc]           DATETIME2 (7) NOT NULL,
    [LastModifiedUtc]      DATETIME2 (7) NOT NULL,
    [RowVersion]           ROWVERSION    NOT NULL,
    [LastFullInductionUtc] DATETIME2 (7) DEFAULT ('1900-01-01T00:00:00.000') NOT NULL,
    [RiskLastModifiedUtc]  DATETIME2 (7) DEFAULT ('1900-01-01T00:00:00.000') NOT NULL,
    [LastInductedUtc]      DATETIME2 (7) DEFAULT ('1900-01-01T00:00:00.000') NOT NULL,
    CONSTRAINT [PK_onside.Induction] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_onside.Induction_onside.ApplicationUser_UserId] FOREIGN KEY ([UserId]) REFERENCES [dbo].[ApplicationUser] ([Id]),
    CONSTRAINT [FK_onside.Induction_onside.Farm_FarmId] FOREIGN KEY ([FarmId]) REFERENCES [dbo].[Farm] ([Id])
);


GO
CREATE NONCLUSTERED INDEX [IX_FarmId]
    ON [dbo].[Induction]([FarmId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_UserId]
    ON [dbo].[Induction]([UserId] ASC);

