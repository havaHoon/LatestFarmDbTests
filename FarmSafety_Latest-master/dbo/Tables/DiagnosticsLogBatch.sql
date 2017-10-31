CREATE TABLE [dbo].[DiagnosticsLogBatch] (
    [Id]                     BIGINT          IDENTITY (1, 1) NOT NULL,
    [BatchCreatedUtc]        DATETIME2 (7)   NOT NULL,
    [BatchNumber]            INT             NOT NULL,
    [CapturedUtcEarliest]    DATETIME2 (7)   NOT NULL,
    [CapturedUtcLatest]      DATETIME2 (7)   NOT NULL,
    [DeviceId]               NVARCHAR (100)  NOT NULL,
    [NumLines]               INT             NOT NULL,
    [SendAttempt]            INT             NOT NULL,
    [UserId]                 BIGINT          NOT NULL,
    [LogLinesJsonCompressed] VARBINARY (MAX) NOT NULL,
    [CreatedUtc]             DATETIME2 (7)   NOT NULL,
    [LastModifiedUtc]        DATETIME2 (7)   NOT NULL,
    [RowVersion]             ROWVERSION      NOT NULL,
    CONSTRAINT [PK_onside.DiagnosticsLogBatch] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
CREATE NONCLUSTERED INDEX [IX_DiagnosticsLogBatch_UserId_CapturedUtcEarliest]
    ON [dbo].[DiagnosticsLogBatch]([UserId] ASC, [CapturedUtcEarliest] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [UX_DiagnosticsLogBatch_DeviceId_CapturedUtcEarliest]
    ON [dbo].[DiagnosticsLogBatch]([DeviceId] ASC, [CapturedUtcEarliest] ASC);

