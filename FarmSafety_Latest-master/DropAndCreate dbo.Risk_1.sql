USE [DEV_FarmSafety]
GO

/****** Object: Table [dbo].[Risk] Script Date: 10/18/2017 4:03:35 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

DROP TABLE [dbo].[Risk];


GO
CREATE TABLE [dbo].[Risk] (
    [Id]               BIGINT            IDENTITY (1, 1) NOT NULL,
    [Description]      NVARCHAR (256)    NOT NULL,
    [FarmId]           BIGINT            NOT NULL,
    [RowVersion]       ROWVERSION        NOT NULL,
    [Title]            NVARCHAR (75)     NOT NULL,
    [Type]             INT               NOT NULL,
    [Likelihood]       INT               NOT NULL,
    [Location]         [sys].[geography] NULL,
    [MitigationState]  INT               NOT NULL,
    [PotentialHarm]    INT               NOT NULL,
    [IsTeamMemberRisk] BIT               NOT NULL
);


