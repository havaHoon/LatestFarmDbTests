CREATE TABLE [dbo].[EmailProcessingTask] (
    [Id]                        BIGINT         IDENTITY (1, 1) NOT NULL,
    [HeaderSubject]             NVARCHAR (MAX) NULL,
    [HeaderToEmail]             NVARCHAR (MAX) NULL,
    [TaskState]                 INT            NOT NULL,
    [TemplateApiName]           NVARCHAR (50)  NULL,
    [TemplateKeyValuePairsJson] NVARCHAR (MAX) NULL,
    [StartProcessingUtc]        DATETIME2 (7)  NULL,
    [EndProcessingUtc]          DATETIME2 (7)  NULL,
    [NumProcessingAttempts]     INT            NOT NULL,
    [CreatedUtc]                DATETIME2 (7)  NOT NULL,
    [LastModifiedUtc]           DATETIME2 (7)  NOT NULL,
    [RowVersion]                ROWVERSION     NOT NULL,
    [RecipientId]               BIGINT         NOT NULL,
    [DelayProcessingUntilUtc]   DATETIME2 (7)  DEFAULT ('1900-01-01T00:00:00.000') NOT NULL,
    [TaskType]                  INT            DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_onside.EmailProcessingTask] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_onside.EmailProcessingTask_onside.ApplicationUser_Recipient_Id] FOREIGN KEY ([RecipientId]) REFERENCES [dbo].[ApplicationUser] ([Id])
);


GO
CREATE NONCLUSTERED INDEX [IX_RecipientId]
    ON [dbo].[EmailProcessingTask]([RecipientId] ASC);

