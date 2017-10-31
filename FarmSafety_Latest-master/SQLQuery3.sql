USE [DEV_FarmSafety]
GO

DECLARE	@return_value Int

EXEC	@return_value = [dbo].[spLetsFindRiskStuff]

SELECT	@return_value as 'Return Value'

GO
