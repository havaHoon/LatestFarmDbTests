CREATE TABLE [dbo].[FarmLocationProcessingTask] (
    [Id]                      BIGINT        NOT NULL,
    [StartProcessingUtc]      DATETIME2 (7) NULL,
    [EndProcessingUtc]        DATETIME2 (7) NULL,
    [CreatedUtc]              DATETIME2 (7) NOT NULL,
    [LastModifiedUtc]         DATETIME2 (7) NOT NULL,
    [RowVersion]              ROWVERSION    NOT NULL,
    [NumProcessingAttempts]   INT           DEFAULT ((0)) NOT NULL,
    [TaskState]               INT           DEFAULT ((10)) NOT NULL,
    [TaskType]                INT           DEFAULT ((1)) NOT NULL,
    [DelayProcessingUntilUtc] DATETIME2 (7) DEFAULT ('1900-01-01T00:00:00.000') NOT NULL,
    CONSTRAINT [PK_onside.FarmLocationProcessingTask] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_onside.FarmLocationProcessingTask_onside.FarmLocation_Id] FOREIGN KEY ([Id]) REFERENCES [dbo].[FarmLocation] ([Id])
);


GO
CREATE NONCLUSTERED INDEX [IX_Id]
    ON [dbo].[FarmLocationProcessingTask]([Id] ASC);

