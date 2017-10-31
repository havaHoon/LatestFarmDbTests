CREATE TABLE [dbo].[PaymentResult] (
    [Id]                   BIGINT          NOT NULL,
    [_xmlCompressed]       VARBINARY (MAX) NULL,
    [CardExpiry]           DATETIME2 (7)   NOT NULL,
    [CardName]             NVARCHAR (100)  NULL,
    [CardNumberObfuscated] NVARCHAR (16)   NULL,
    [CardType]             NVARCHAR (16)   NULL,
    [ErrorMessage]         NVARCHAR (255)  NULL,
    [ExternalBillingId]    NVARCHAR (16)   NULL,
    [ExternalTxnRef]       NVARCHAR (16)   NULL,
    [PaymentServiceType]   INT             NOT NULL,
    [CreatedUtc]           DATETIME2 (7)   NOT NULL,
    [LastModifiedUtc]      DATETIME2 (7)   NOT NULL,
    [RowVersion]           ROWVERSION      NOT NULL,
    [CardNumberSecure]     NVARCHAR (256)  NULL,
    CONSTRAINT [PK_onside.PaymentResult] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_onside.PaymentResult_onside.Payment_Id] FOREIGN KEY ([Id]) REFERENCES [dbo].[Payment] ([Id])
);


GO
CREATE NONCLUSTERED INDEX [IX_Id]
    ON [dbo].[PaymentResult]([Id] ASC);

