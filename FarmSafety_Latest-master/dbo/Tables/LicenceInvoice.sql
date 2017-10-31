CREATE TABLE [dbo].[LicenceInvoice] (
    [Id]               BIGINT        NOT NULL,
    [DateFrom]         DATETIME2 (7) NOT NULL,
    [DateTo]           DATETIME2 (7) NOT NULL,
    [InvoiceType]      INT           NOT NULL,
    [TemplateId]       BIGINT        NULL,
    [RelatedInvoiceId] BIGINT        NULL,
    CONSTRAINT [PK_onside.LicenceInvoice] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_onside.LicenceInvoice_onside.LicenceEntity_Id] FOREIGN KEY ([Id]) REFERENCES [dbo].[LicenceEntity] ([Id]),
    CONSTRAINT [FK_onside.LicenceInvoice_onside.LicenceInvoice_RelatedInvoiceId] FOREIGN KEY ([RelatedInvoiceId]) REFERENCES [dbo].[LicenceInvoice] ([Id]),
    CONSTRAINT [FK_onside.LicenceInvoice_onside.LicenceTemplate_TemplateId] FOREIGN KEY ([TemplateId]) REFERENCES [dbo].[LicenceTemplate] ([Id])
);


GO
CREATE NONCLUSTERED INDEX [IX_Id]
    ON [dbo].[LicenceInvoice]([Id] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_TemplateId]
    ON [dbo].[LicenceInvoice]([TemplateId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_RelatedInvoiceId]
    ON [dbo].[LicenceInvoice]([RelatedInvoiceId] ASC);

