CREATE TABLE [dbo].[LicenceDetailLine] (
    [Id]                               BIGINT          IDENTITY (1, 1) NOT NULL,
    [AmountExclPreDiscount]            DECIMAL (10, 2) NOT NULL,
    [AmountExcl]                       DECIMAL (10, 2) NOT NULL,
    [AmountGst]                        DECIMAL (10, 2) NOT NULL,
    [AmountIncl]                       DECIMAL (10, 2) NOT NULL,
    [DiscountAmountApplied]            DECIMAL (10, 2) NOT NULL,
    [IsPromoCodeApplied]               BIT             NOT NULL,
    [LicencedUserId]                   BIGINT          NOT NULL,
    [LicenceEntityId]                  BIGINT          NOT NULL,
    [CreatedUtc]                       DATETIME2 (7)   NOT NULL,
    [LastModifiedUtc]                  DATETIME2 (7)   NOT NULL,
    [RowVersion]                       ROWVERSION      NOT NULL,
    [PaymentTypeDiscountAmountApplied] DECIMAL (10, 2) DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_onside.LicenceDetailLine] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_onside.LicenceDetailLine_onside.ApplicationUser_LicencedUserId] FOREIGN KEY ([LicencedUserId]) REFERENCES [dbo].[ApplicationUser] ([Id]),
    CONSTRAINT [FK_onside.LicenceDetailLine_onside.LicenceEntity_LicenceEntityId] FOREIGN KEY ([LicenceEntityId]) REFERENCES [dbo].[LicenceEntity] ([Id])
);


GO
CREATE NONCLUSTERED INDEX [IX_LicencedUserId]
    ON [dbo].[LicenceDetailLine]([LicencedUserId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_LicenceEntityId]
    ON [dbo].[LicenceDetailLine]([LicenceEntityId] ASC);

