CREATE TABLE [dbo].[BillPayer] (
    [Id]              BIGINT        IDENTITY (1, 1) NOT NULL,
    [LicenceType]     INT           NOT NULL,
    [UserId]          BIGINT        NOT NULL,
    [CreatedUtc]      DATETIME2 (7) NOT NULL,
    [LastModifiedUtc] DATETIME2 (7) NOT NULL,
    [RowVersion]      ROWVERSION    NOT NULL,
    CONSTRAINT [PK_onside.BillPayer] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_onside.BillPayer_onside.ApplicationUser_UserId] FOREIGN KEY ([UserId]) REFERENCES [dbo].[ApplicationUser] ([Id])
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [UX_BillPayer_UserId_LicenceType]
    ON [dbo].[BillPayer]([UserId] ASC, [LicenceType] ASC);

