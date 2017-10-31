CREATE TABLE [dbo].[ImageProcessingTask] (
    [Id]                      BIGINT          NOT NULL,
    [ImageLarge]              VARBINARY (MAX) NULL,
    [ImageSmall]              VARBINARY (MAX) NULL,
    [TaskState]               INT             NOT NULL,
    [ImageFileExtension]      NVARCHAR (5)    NULL,
    [ImageLargeMd5]           NVARCHAR (32)   NULL,
    [ImageSmallMd5]           NVARCHAR (32)   NULL,
    [ImageCropTop]            INT             NOT NULL,
    [ImageCropLeft]           INT             NOT NULL,
    [ImageCropWidth]          INT             NOT NULL,
    [ImageCropHeight]         INT             NOT NULL,
    [CropComplete]            BIT             NOT NULL,
    [StartProcessingUtc]      DATETIME2 (7)   NULL,
    [EndProcessingUtc]        DATETIME2 (7)   NULL,
    [CreatedUtc]              DATETIME2 (7)   NOT NULL,
    [LastModifiedUtc]         DATETIME2 (7)   NOT NULL,
    [RowVersion]              ROWVERSION      NOT NULL,
    [NumProcessingAttempts]   INT             DEFAULT ((0)) NOT NULL,
    [DelayProcessingUntilUtc] DATETIME2 (7)   DEFAULT ('1900-01-01T00:00:00.000') NOT NULL,
    CONSTRAINT [PK_onside.ImageProcessingTask] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_onside.ImageProcessingTask_onside.ImageEntity_Id] FOREIGN KEY ([Id]) REFERENCES [dbo].[ImageEntity] ([Id])
);


GO
CREATE NONCLUSTERED INDEX [IX_Id]
    ON [dbo].[ImageProcessingTask]([Id] ASC);

