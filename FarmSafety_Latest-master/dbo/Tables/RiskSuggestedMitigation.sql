CREATE TABLE [dbo].[RiskSuggestedMitigation] (
    [Id]              BIGINT         IDENTITY (1, 1) NOT NULL,
    [Description]     NVARCHAR (100) NOT NULL,
    [RiskId]          BIGINT         NOT NULL,
    [SortOrder]       INT            NOT NULL,
    [CreatedUtc]      DATETIME2 (7)  NOT NULL,
    [LastModifiedUtc] DATETIME2 (7)  NOT NULL,
    [RowVersion]      ROWVERSION     NOT NULL,
    CONSTRAINT [PK_onside.RiskSuggestedMitigation] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_onside.RiskSuggestedMitigation_onside.Risk_RiskId] FOREIGN KEY ([RiskId]) REFERENCES [dbo].[Risk] ([Id])
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [UX_RiskSuggestedMitigation_RiskId_SortOrder]
    ON [dbo].[RiskSuggestedMitigation]([RiskId] ASC, [SortOrder] ASC);

