CREATE TABLE [dbo].[UserCardWhitelist] (
    [Id]                  BIGINT         IDENTITY (1, 1) NOT NULL,
    [PaymentType]         INT            NOT NULL,
    [CardHolderName]      NVARCHAR (100) NULL,
    [ExpiryDate]          DATETIME2 (7)  NOT NULL,
    [IssueDate]           DATETIME2 (7)  NOT NULL,
    [RecordGenerationUtc] DATETIME2 (7)  NOT NULL,
    [CreatedUtc]          DATETIME2 (7)  NOT NULL,
    [LastModifiedUtc]     DATETIME2 (7)  NOT NULL,
    [RowVersion]          ROWVERSION     NOT NULL,
    [CardNumberSecure]    NVARCHAR (256) DEFAULT ('') NOT NULL,
    [BarcodeSecure]       NVARCHAR (256) NULL,
    [CardNumber9Secure]   NVARCHAR (256) NULL,
    [BinRange]            NVARCHAR (6)   DEFAULT ('') NOT NULL,
    CONSTRAINT [PK_onside.UserCardWhitelist] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [UX_UserCardWhitelist_CardNumberSecure_PaymentType]
    ON [dbo].[UserCardWhitelist]([CardNumberSecure] ASC, [PaymentType] ASC);

