CREATE TABLE [dbo].[LicenceEntity] (
    [Id]                               BIGINT          IDENTITY (1, 1) NOT NULL,
    [AmountExclPreDiscount]            DECIMAL (10, 2) NOT NULL,
    [AmountExcl]                       DECIMAL (10, 2) NOT NULL,
    [AmountGst]                        DECIMAL (10, 2) NOT NULL,
    [AmountIncl]                       DECIMAL (10, 2) NOT NULL,
    [BillPayerId]                      BIGINT          NOT NULL,
    [DiscountAmountApplied]            DECIMAL (10, 2) NOT NULL,
    [DiscountPercent]                  DECIMAL (6, 1)  NOT NULL,
    [GstRate]                          DECIMAL (6, 1)  NOT NULL,
    [LicenceEntityType]                INT             NOT NULL,
    [LicenceType]                      INT             NOT NULL,
    [LicenceState]                     INT             NOT NULL,
    [NumLicenced]                      INT             NOT NULL,
    [PromoCodeId]                      BIGINT          NULL,
    [CreatedUtc]                       DATETIME2 (7)   NOT NULL,
    [LastModifiedUtc]                  DATETIME2 (7)   NOT NULL,
    [RowVersion]                       ROWVERSION      NOT NULL,
    [PaymentType]                      INT             DEFAULT ((0)) NOT NULL,
    [PaymentTypeDiscountAmountApplied] DECIMAL (10, 2) DEFAULT ((0)) NOT NULL,
    [PaymentTypeDiscountPercent]       DECIMAL (6, 1)  DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_onside.LicenceEntity] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_onside.LicenceEntity_onside.BillPayer_BillPayerId] FOREIGN KEY ([BillPayerId]) REFERENCES [dbo].[BillPayer] ([Id]),
    CONSTRAINT [FK_onside.LicenceEntity_onside.PromoCode_PromoCodeId] FOREIGN KEY ([PromoCodeId]) REFERENCES [dbo].[PromoCode] ([Id])
);


GO
CREATE NONCLUSTERED INDEX [IX_BillPayerId]
    ON [dbo].[LicenceEntity]([BillPayerId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_PromoCodeId]
    ON [dbo].[LicenceEntity]([PromoCodeId] ASC);

