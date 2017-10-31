CREATE TABLE [dbo].[ApplicationUser] (
    [Id]                               BIGINT         IDENTITY (1, 1) NOT NULL,
    [FirstName]                        NVARCHAR (50)  NOT NULL,
    [LastName]                         NVARCHAR (50)  NOT NULL,
    [CreatedUtc]                       DATETIME2 (7)  NOT NULL,
    [LastModifiedUtc]                  DATETIME2 (7)  NOT NULL,
    [RowVersion]                       ROWVERSION     NOT NULL,
    [Email]                            NVARCHAR (256) NOT NULL,
    [EmailConfirmed]                   BIT            NOT NULL,
    [PasswordHash]                     NVARCHAR (MAX) NOT NULL,
    [SecurityStamp]                    NVARCHAR (MAX) NOT NULL,
    [PhoneNumber]                      NVARCHAR (25)  NOT NULL,
    [PhoneNumberConfirmed]             BIT            NOT NULL,
    [TwoFactorEnabled]                 BIT            NOT NULL,
    [LockoutEndDateUtc]                DATETIME2 (7)  NULL,
    [LockoutEnabled]                   BIT            NOT NULL,
    [AccessFailedCount]                INT            NOT NULL,
    [UserName]                         NVARCHAR (256) NOT NULL,
    [AgreedToTermsAndConditionsUtc]    DATETIME2 (7)  NULL,
    [IsCasualUseDisabled]              BIT            DEFAULT ((0)) NOT NULL,
    [LatestCasualUseDate]              DATETIME2 (7)  NULL,
    [LatestPaidBusinessLicenceEndDate] DATETIME2 (7)  NULL,
    [LatestPaidFarmLicenceEndDate]     DATETIME2 (7)  NULL,
    CONSTRAINT [PK_onside.ApplicationUser] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex]
    ON [dbo].[ApplicationUser]([UserName] ASC);

