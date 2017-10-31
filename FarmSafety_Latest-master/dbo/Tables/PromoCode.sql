CREATE TABLE [dbo].[PromoCode] (
    [Id]              BIGINT         IDENTITY (1, 1) NOT NULL,
    [Code]            NVARCHAR (50)  NOT NULL,
    [ActivatedUtc]    DATETIME2 (7)  NULL,
    [DateFrom]        DATETIME2 (7)  NOT NULL,
    [DateTo]          DATETIME2 (7)  NULL,
    [DeletedUtc]      DATETIME2 (7)  NULL,
    [DiscountPercent] DECIMAL (6, 1) NOT NULL,
    [LicenceType]     INT            NOT NULL,
    [CreatedUtc]      DATETIME2 (7)  NOT NULL,
    [LastModifiedUtc] DATETIME2 (7)  NOT NULL,
    [RowVersion]      ROWVERSION     NOT NULL,
    [PaymentGroup]    INT            DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_onside.PromoCode] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [UX_PromoCode_Code]
    ON [dbo].[PromoCode]([Code] ASC);

