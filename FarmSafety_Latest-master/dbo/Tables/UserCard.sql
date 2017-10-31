CREATE TABLE [dbo].[UserCard] (
    [Id]                   BIGINT         IDENTITY (1, 1) NOT NULL,
    [BillingId]            NVARCHAR (32)  NOT NULL,
    [BillPayerId]          BIGINT         NOT NULL,
    [CardExpiry]           DATETIME2 (7)  NOT NULL,
    [CardName]             NVARCHAR (100) NULL,
    [CardNumberObfuscated] NVARCHAR (16)  NULL,
    [CardState]            INT            NOT NULL,
    [CardType]             NVARCHAR (16)  NULL,
    [DeletedUtc]           DATETIME2 (7)  NULL,
    [ExternalBillingId]    NVARCHAR (16)  NULL,
    [CreatedUtc]           DATETIME2 (7)  NOT NULL,
    [LastModifiedUtc]      DATETIME2 (7)  NOT NULL,
    [RowVersion]           ROWVERSION     NOT NULL,
    [PaymentType]          INT            DEFAULT ((10)) NOT NULL,
    [CardNumberSecure]     NVARCHAR (256) NULL,
    CONSTRAINT [PK_onside.UserCard] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_onside.UserCard_onside.BillPayer_BillPayerId] FOREIGN KEY ([BillPayerId]) REFERENCES [dbo].[BillPayer] ([Id])
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [UX_UserCard_BillingId]
    ON [dbo].[UserCard]([BillingId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_BillPayerId]
    ON [dbo].[UserCard]([BillPayerId] ASC);

