CREATE TABLE [dbo].[FtpDownloadProcessingTask] (
    [Id]                      BIGINT        IDENTITY (1, 1) NOT NULL,
    [TaskState]               INT           NOT NULL,
    [DelayProcessingUntilUtc] DATETIME2 (7) NOT NULL,
    [StartProcessingUtc]      DATETIME2 (7) NULL,
    [EndProcessingUtc]        DATETIME2 (7) NULL,
    [NumProcessingAttempts]   INT           NOT NULL,
    [CreatedUtc]              DATETIME2 (7) NOT NULL,
    [LastModifiedUtc]         DATETIME2 (7) NOT NULL,
    [RowVersion]              ROWVERSION    NOT NULL,
    CONSTRAINT [PK_onside.FtpDownloadProcessingTask] PRIMARY KEY CLUSTERED ([Id] ASC)
);

