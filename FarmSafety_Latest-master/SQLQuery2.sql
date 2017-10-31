USE [DEV_FarmSafety]
GO

DECLARE	@return_value Int

EXEC	@return_value = [dbo].[spLetsStoreSomeRiskStuff]

SELECT	@return_value as 'Return Value'

GO
