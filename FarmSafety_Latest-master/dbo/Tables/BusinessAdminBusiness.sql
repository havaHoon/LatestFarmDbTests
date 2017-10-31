CREATE TABLE [dbo].[BusinessAdminBusiness] (
    [Id]                  BIGINT        IDENTITY (1, 1) NOT NULL,
    [BusinessAdminRoleId] BIGINT        NOT NULL,
    [BusinessId]          BIGINT        NOT NULL,
    [CreatedUtc]          DATETIME2 (7) NOT NULL,
    [LastModifiedUtc]     DATETIME2 (7) NOT NULL,
    [RowVersion]          ROWVERSION    NOT NULL,
    [JobRole]             NVARCHAR (50) NULL,
    [IsBillPayer]         BIT           DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_onside.BusinessAdminBusiness] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_onside.BusinessAdminBusiness_onside.Business_BusinessId] FOREIGN KEY ([BusinessId]) REFERENCES [dbo].[Business] ([Id]),
    CONSTRAINT [FK_onside.BusinessAdminBusiness_onside.BusinessAdminRole_BusinessAdminRoleId] FOREIGN KEY ([BusinessAdminRoleId]) REFERENCES [dbo].[BusinessAdminRole] ([Id])
);


GO
CREATE NONCLUSTERED INDEX [IX_BusinessAdminRoleId]
    ON [dbo].[BusinessAdminBusiness]([BusinessAdminRoleId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_BusinessId]
    ON [dbo].[BusinessAdminBusiness]([BusinessId] ASC);

