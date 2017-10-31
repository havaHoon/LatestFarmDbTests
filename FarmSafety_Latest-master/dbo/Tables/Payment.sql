CREATE TABLE [dbo].[Payment] (
    [Id]                BIGINT          IDENTITY (1, 1) NOT NULL,
    [AmountExcl]        DECIMAL (10, 2) NOT NULL,
    [AmountGst]         DECIMAL (10, 2) NOT NULL,
    [AmountIncl]        DECIMAL (10, 2) NOT NULL,
    [UserCardId]        BIGINT          NULL,
    [LicenceInvoiceId]  BIGINT          NOT NULL,
    [LicenceState]      INT             NOT NULL,
    [MerchantReference] NVARCHAR (64)   NULL,
    [ProcessedUtc]      DATETIME2 (7)   NULL,
    [Status]            INT             NOT NULL,
    [TxnId]             NVARCHAR (16)   NULL,
    [CreatedUtc]        DATETIME2 (7)   NOT NULL,
    [LastModifiedUtc]   DATETIME2 (7)   NOT NULL,
    [RowVersion]        ROWVERSION      NOT NULL,
    [PaymentType]       INT             DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_onside.Payment] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_onside.Payment_onside.LicenceInvoice_LicenceInvoiceId] FOREIGN KEY ([LicenceInvoiceId]) REFERENCES [dbo].[LicenceInvoice] ([Id]),
    CONSTRAINT [FK_onside.Payment_onside.UserCard_UserCardId] FOREIGN KEY ([UserCardId]) REFERENCES [dbo].[UserCard] ([Id])
);


GO
CREATE NONCLUSTERED INDEX [IX_UserCardId]
    ON [dbo].[Payment]([UserCardId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_LicenceInvoiceId]
    ON [dbo].[Payment]([LicenceInvoiceId] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [UX_Payment_TxnId]
    ON [dbo].[Payment]([TxnId] ASC);

