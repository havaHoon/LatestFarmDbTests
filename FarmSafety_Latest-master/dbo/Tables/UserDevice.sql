CREATE TABLE [dbo].[UserDevice] (
    [Id]                BIGINT         IDENTITY (1, 1) NOT NULL,
    [DeviceId]          NVARCHAR (100) NULL,
    [DeviceType]        INT            NOT NULL,
    [FirmwareVersion]   NVARCHAR (100) NULL,
    [HardwareVersion]   NVARCHAR (100) NULL,
    [LatestActiveUtc]   DATETIME2 (7)  NULL,
    [LatestInactiveUtc] DATETIME2 (7)  NULL,
    [Manufacturer]      NVARCHAR (100) NULL,
    [TotalMemory]       BIGINT         NOT NULL,
    [UserId]            BIGINT         NOT NULL,
    [CreatedUtc]        DATETIME2 (7)  NOT NULL,
    [LastModifiedUtc]   DATETIME2 (7)  NOT NULL,
    [RowVersion]        ROWVERSION     NOT NULL,
    [AppBuild]          NVARCHAR (20)  NULL,
    [AppVersion]        NVARCHAR (20)  NULL,
    CONSTRAINT [PK_onside.UserDevice] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_onside.UserDevice_onside.ApplicationUser_UserId] FOREIGN KEY ([UserId]) REFERENCES [dbo].[ApplicationUser] ([Id])
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [UX_UserDevice_UserId_DeviceId]
    ON [dbo].[UserDevice]([UserId] ASC, [DeviceId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_UserDevice_DeviceId]
    ON [dbo].[UserDevice]([DeviceId] ASC);

