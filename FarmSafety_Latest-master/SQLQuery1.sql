DECLARE @RC AS INT, @Description AS VARCHAR(100), @FarmId AS INT, @TITLE AS VARCHAR(100), @Type AS INT, @Likelihood AS INT, @PotentialHarm AS INT;

SELECT @RC = 0,
		@Description = 'Description',
		@FarmId = 6,
		@Title = 'Title',
		@Type = 6,
		@Likelihood = 6,
		@PotentialHarm = 6;		

EXECUTE @RC = [spLetsStoreSomeRiskStuff] @Description,@FarmId,@Title,@Type,@Likelihood,@PotentialHarm ;
