using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Microsoft.VisualStudio.TestTools.UnitTesting;

namespace SqlDatabaseUnitTests
{
    public class DataAccess
    {
        public static string ConnectionString = ConfigurationManager.ConnectionStrings["MyConnection"].ConnectionString;

        SqlConnection _sqlConn = new SqlConnection(ConnectionString);

        public bool Connect()
        {
            _sqlConn = new SqlConnection(ConnectionString);
            _sqlConn.Open();

            return _sqlConn.State == ConnectionState.Open;
        }

        public bool Disconnect()
        {
            _sqlConn = new SqlConnection(ConnectionString);
            _sqlConn.Open();
            _sqlConn.Close();

            return _sqlConn.State == ConnectionState.Closed;
        }

        public SqlCommand GetSqlCommand(string storedProcedure)
        {
            var sqlCmd = new SqlCommand(storedProcedure, _sqlConn);
            sqlCmd.CommandType = CommandType.StoredProcedure;
            return sqlCmd;
        }

        public bool InsertData()
        {
            using (var connection = new SqlConnection(ConnectionString))
            {
                using (var command = new SqlCommand())
                {
                    command.Connection = connection;
                    command.CommandType = CommandType.Text;
                    command.CommandText =
                        "INSERT INTO [dbo].[Risk](Description,FarmId,CreatedUTC,LastModifiedUtc,Title,Type,Likelihood,MitigationState,PotentialHarm,IsTeamMemberRisk) Values('Creek running through property',51666,@createdUtc,@lastModifiedUtc,'Farm Creek', 1, 6, 6, 6,9)";
                    command.Parameters.AddWithValue("@createdUtc", DateTime.Today);
                    command.Parameters.AddWithValue("@lastModifiedUtc", DateTime.Today);
                    try
                    {
                        connection.Open();
                        var rows = command.ExecuteNonQuery();
                        if (rows > 0) return true;
                    }
                    catch (SqlException e)
                    {
                        Console.WriteLine(e);
                        throw;
                    }

                }
            }

            return false;
        }

        public bool InsertInvalidData(RiskObject farmData)
        {
            using (var connection = new SqlConnection(ConnectionString))
            {
                using (var command = new SqlCommand())
                {
                    command.Connection = connection;
                    command.CommandType = CommandType.Text;
                    command.CommandText =
                        "INSERT into [DEV_FarmSafety].[dbo].[Risk] (Description, FarmId, Title, Likelihood,PotentialHarm) VALUES (@description, @farmId, @title, @likelihood, @potentialHarm)";
                    command.Parameters.AddWithValue("@description", farmData.Description);
                    //Missing parameter to force an exception
                    command.Parameters.AddWithValue("@title", farmData.Title);
                    command.Parameters.AddWithValue("@likelihood", farmData.Likelihood);
                    command.Parameters.AddWithValue("potentialHarm", farmData.PotentialHarm);
                    try
                    {
                        connection.Open();
                        var rows = command.ExecuteNonQuery();
                        if (rows > 0) return false;
                    }
                    catch (SqlException e)
                    {
                        Assert.AreEqual(e, e.GetBaseException());

                    }

                }
            }
            return true;
        }

        public RiskObject GetRisk()
        {
            using (var connection = new SqlConnection(ConnectionString))
            {
                using (var command = new SqlCommand())
                {
                    command.Connection = connection;
                    command.CommandType = CommandType.Text;
                    command.CommandText =
                        "SELECT [Description],[FarmId],[CreatedUTC],[LastModifiedUtc],[Title],[Type],[Likelihood],[MitigationState],[PotentialHarm],[IsTeamMemberRisk] FROM DEV_FarmSafety.dbo.Risk";
                    //(Description, FarmId, Title, Likelihood,PotentialHarm);
                    try
                    {
                        connection.Open();
                        using (var reader = command.ExecuteReader())
                        {
                            if (!reader.HasRows)
                                return null;

                            var farmRisk = new RiskObject();

                            if (reader.Read())
                            {
                                farmRisk.Description = reader.GetString(0);
                                farmRisk.FarmId = Convert.ToInt32(reader.GetValue(1));
                                farmRisk.CreatedUtc = DateTime.Today;
                                farmRisk.LastModifiedUtc = DateTime.Today;
                                farmRisk.Title = reader.GetString(4);
                                farmRisk.Type = reader.GetInt32(5);
                                farmRisk.MitigationState = reader.GetInt32(6);
                                farmRisk.Likelihood = reader.GetInt32(7);
                                farmRisk.PotentialHarm = reader.GetInt32(8);
                            }
                            return farmRisk;
                        }
                    }
                    catch (SqlException e)
                    {
                        Console.WriteLine(e);
                        throw;
                    }

                }
            }

        }

        public bool ClearRiskTable()
        {
            using (var connection = new SqlConnection(ConnectionString))
            {


                using (var command = new SqlCommand("DELETE FROM [dbo].[Risk]", connection))
                {
                    try
                    {
                        connection.Open();
                        var rows = command.ExecuteNonQuery();
                        if (rows > 0)
                        {
                            return true;
                        }

                    }
                    catch (Exception e)
                    {
                        Console.WriteLine(e);
                        throw;
                    }
                    return false;
                }
            }


        }
    }
}
