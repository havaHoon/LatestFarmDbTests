CREATE TABLE [dbo].[RiskMitigation] (
    [Id]              BIGINT         IDENTITY (1, 1) NOT NULL,
    [Description]     NVARCHAR (100) NOT NULL,
    [RiskId]          BIGINT         NOT NULL,
    [CreatedUtc]      DATETIME2 (7)  NOT NULL,
    [LastModifiedUtc] DATETIME2 (7)  NOT NULL,
    [RowVersion]      ROWVERSION     NOT NULL,
    [SortOrder]       INT            DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_onside.RiskMitigation] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_onside.RiskMitigation_onside.Risk_RiskId] FOREIGN KEY ([RiskId]) REFERENCES [dbo].[Risk] ([Id])
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [UX_RiskMitigation_RiskId_SortOrder]
    ON [dbo].[RiskMitigation]([RiskId] ASC, [SortOrder] ASC);

