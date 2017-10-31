CREATE TABLE [dbo].[FarmLocation] (
    [Id]                                  BIGINT            IDENTITY (1, 1) NOT NULL,
    [FarmId]                              BIGINT            NOT NULL,
    [GeoFenceCircleCentre]                [sys].[geography] NOT NULL,
    [GeoFenceCircleCircumference]         [sys].[geography] NOT NULL,
    [GeoFenceCircleRadiusMetres]          INT               NOT NULL,
    [GeoFencePolygon]                     [sys].[geography] NOT NULL,
    [CreatedUtc]                          DATETIME2 (7)     NOT NULL,
    [LastModifiedUtc]                     DATETIME2 (7)     NOT NULL,
    [RowVersion]                          ROWVERSION        NOT NULL,
    [Geohash]                             NVARCHAR (6)      DEFAULT ('') NOT NULL,
    [NumNeighbourPolygonOverlapsOfCircle] INT               DEFAULT ((0)) NOT NULL,
    [RepositioningRadiusMetres]           INT               DEFAULT ((0)) NOT NULL,
    [ActivatedUtc]                        DATETIME2 (7)     NULL,
    CONSTRAINT [PK_onside.FarmLocation] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_onside.FarmLocation_onside.Farm_FarmId] FOREIGN KEY ([FarmId]) REFERENCES [dbo].[Farm] ([Id])
);


GO
CREATE NONCLUSTERED INDEX [IX_FarmId]
    ON [dbo].[FarmLocation]([FarmId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_FarmLocation_Geohash]
    ON [dbo].[FarmLocation]([Geohash] ASC);


GO
CREATE SPATIAL INDEX [SX_FarmLocation_GeoFenceCircleCentre]
    ON [dbo].[FarmLocation] ([GeoFenceCircleCentre])
    USING GEOGRAPHY_GRID
    WITH  (
            GRIDS = (LEVEL_1 = MEDIUM, LEVEL_2 = MEDIUM, LEVEL_3 = MEDIUM, LEVEL_4 = MEDIUM)
          );

