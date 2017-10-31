CREATE TABLE [dbo].[FarmEmergencyPlan] (
    [Id]                       BIGINT         NOT NULL,
    [ContactPersonName]        NVARCHAR (100) NULL,
    [ContactPersonNumber]      NVARCHAR (25)  NULL,
    [DairyCompanySupplyNumber] NVARCHAR (25)  NULL,
    [EmergencyServicesNumber]  NVARCHAR (25)  NULL,
    [FarmName]                 NVARCHAR (100) NOT NULL,
    [FirstAidPersonName]       NVARCHAR (100) NULL,
    [FirstAidPersonNumber]     NVARCHAR (25)  NULL,
    [NearestNeighbourNumber]   NVARCHAR (25)  NULL,
    [RapidNumber]              NVARCHAR (25)  NOT NULL,
    [RoadName]                 NVARCHAR (100) NOT NULL,
    [CreatedUtc]               DATETIME2 (7)  NOT NULL,
    [LastModifiedUtc]          DATETIME2 (7)  NOT NULL,
    [RowVersion]               ROWVERSION     NOT NULL,
    CONSTRAINT [PK_onside.FarmEmergencyPlan] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_onside.FarmEmergencyPlan_onside.Farm_Id] FOREIGN KEY ([Id]) REFERENCES [dbo].[Farm] ([Id])
);


GO
CREATE NONCLUSTERED INDEX [IX_Id]
    ON [dbo].[FarmEmergencyPlan]([Id] ASC);

