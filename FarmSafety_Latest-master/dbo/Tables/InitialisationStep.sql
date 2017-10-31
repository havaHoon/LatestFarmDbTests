CREATE TABLE [dbo].[InitialisationStep] (
    [Id]              BIGINT         IDENTITY (1, 1) NOT NULL,
    [StepName]        NVARCHAR (100) NOT NULL,
    [CreatedUtc]      DATETIME2 (7)  NOT NULL,
    [LastModifiedUtc] DATETIME2 (7)  NOT NULL,
    [RowVersion]      ROWVERSION     NOT NULL,
    CONSTRAINT [PK_onside.InitialisationStep] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [UX_InitialisationStep_StepName]
    ON [dbo].[InitialisationStep]([StepName] ASC);

