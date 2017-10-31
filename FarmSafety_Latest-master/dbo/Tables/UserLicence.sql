CREATE TABLE [dbo].[UserLicence] (
    [Id]                  BIGINT        NOT NULL,
    [DateFrom]            DATETIME2 (7) NOT NULL,
    [DateTo]              DATETIME2 (7) NOT NULL,
    [LicenceType]         INT           NOT NULL,
    [UserId]              BIGINT        NOT NULL,
    [CreatedUtc]          DATETIME2 (7) NOT NULL,
    [LastModifiedUtc]     DATETIME2 (7) NOT NULL,
    [RowVersion]          ROWVERSION    NOT NULL,
    [PaymentProcessedUtc] DATETIME2 (7) NULL,
    [BillPayerId]         BIGINT        DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_onside.UserLicence] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_onside.UserLicence_onside.ApplicationUser_UserId] FOREIGN KEY ([UserId]) REFERENCES [dbo].[ApplicationUser] ([Id]),
    CONSTRAINT [FK_onside.UserLicence_onside.BillPayer_BillPayerId] FOREIGN KEY ([BillPayerId]) REFERENCES [dbo].[BillPayer] ([Id]),
    CONSTRAINT [FK_onside.UserLicence_onside.LicenceDetailLine_Id] FOREIGN KEY ([Id]) REFERENCES [dbo].[LicenceDetailLine] ([Id])
);


GO
CREATE NONCLUSTERED INDEX [IX_Id]
    ON [dbo].[UserLicence]([Id] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [UX_UserLicence_UserId_DateTo_LicenceType_BillPayerId]
    ON [dbo].[UserLicence]([UserId] ASC, [DateTo] ASC, [LicenceType] ASC, [BillPayerId] ASC);

