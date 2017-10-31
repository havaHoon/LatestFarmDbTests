/* This is the initial SP for the DEMO		*/
/* Written by Hamish Watson					*/
/* Date: 3rd November 2017 -- Seattle time	*/

CREATE PROCEDURE spLetsFindRiskStuff
AS
    BEGIN

        SELECT TOP 5
      [Description]
      ,[FarmId]
      ,[Title]
      ,[Type]
      ,[Likelihood]
      ,[PotentialHarm]
      
  FROM [Risk];

        RETURN 0;
    END;

