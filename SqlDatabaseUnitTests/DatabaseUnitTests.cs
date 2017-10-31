using System;
using System.Data.SqlClient;
using Microsoft.VisualStudio.TestTools.UnitTesting;

namespace SqlDatabaseUnitTests
{
    [TestClass]
    public class UnitTest1
    {
        [TestClass]
        public class DatabaseTests
        {
            private DataAccess dataAccess = new DataAccess();

            /// <summary>
            /// Check the DB will connect using the connection string provided in the config file
            /// </summary>
            [TestMethod]
            public void CheckDatabaseConnection()
            {

                try
                {
                    Assert.IsTrue(dataAccess.Connect());
                }
                catch (SqlException e)
                {
                    Console.WriteLine(e);
                    throw;
                }

            }

            [TestMethod]
            public void CheckDatabaseDisconnects()
            {

                try
                {
                    Assert.IsTrue(dataAccess.Disconnect());
                }
                catch (SqlException e)
                {
                    Console.WriteLine(e);
                    throw;
                }

            }


            [TestMethod]
            public void SetRiskDataAndCheckForNewEntry()
            {
                //Insert Risk method will return true if Insert Risk SP sucessfully stores data in the db
                Assert.IsTrue(dataAccess.InsertData());

                //Check to see if db was successfully cleaned 
                Assert.IsTrue(dataAccess.ClearRiskTable());
            }

            [TestMethod]
            public void SendInvalidRiskDataCatchException()
            {
                var invalidDataException = dataAccess.InsertInvalidData(
                    new RiskObject(
                        "Creek running through property"
                        , 51666
                        , DateTime.Now
                        , DateTime.UtcNow
                        , "Farm Creek"
                        , 1
                        , 6
                        , 6
                        , 6
                    ));

                //If SQL exception is thrown invalidDataException will return true;
                Assert.IsTrue(invalidDataException);
            }


            [TestMethod]
            public void GetRiskFromDbAndCompareToExpected()
            {
                Assert.IsTrue(dataAccess.InsertData());
                //GetRisk execute a SELECT querie and return values from DB and store in acutalData
                var actualData = dataAccess.GetRisk();


                var expectedData = new RiskObject(
                    "Creek running through property"
                    , 51666
                    , DateTime.Today
                    , DateTime.Today
                    , "Farm Creek"
                    , 1
                    , 6
                    , 6
                    , 6
                );

                Assert.AreEqual(actualData.Description, expectedData.Description);
                Assert.AreEqual(actualData.FarmId, expectedData.FarmId);
                Assert.AreEqual(actualData.CreatedUtc, expectedData.CreatedUtc);
                Assert.AreEqual(actualData.LastModifiedUtc, expectedData.LastModifiedUtc);
                Assert.AreEqual(actualData.Title, expectedData.Title);
                Assert.AreEqual(actualData.Type, expectedData.Type);
                Assert.AreEqual(actualData.MitigationState, expectedData.MitigationState);
                Assert.AreEqual(actualData.Likelihood, expectedData.Likelihood);
                Assert.AreEqual(actualData.PotentialHarm, expectedData.PotentialHarm);

                Assert.IsTrue(dataAccess.ClearRiskTable());

            }
        }
    }
}
