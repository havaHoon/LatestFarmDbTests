using System;

namespace SqlDatabaseUnitTests
{
    public class RiskObject
    {
        public string Description { get; set; }

        public int FarmId { get; set; }

        public DateTime CreatedUtc { get; set; }

        public DateTime LastModifiedUtc { get; set; }

        public string Title { get; set; }

        public int Type { get; set; }

        public int Likelihood { get; set; }

        public int MitigationState { get; set; }

        public int PotentialHarm { get; set; }

        public int IsTeamMemberRisk { get; set; }

        public RiskObject(string description, int farmId, DateTime createdUtc, DateTime lastModifiedUtc, string title, int type, int likelihood, int mitigation, int potentialHarm)
        {
            Description = description;
            FarmId = farmId;
            CreatedUtc = createdUtc;
            LastModifiedUtc = lastModifiedUtc;
            Title = title;
            Type = type;
            Likelihood = likelihood;
            MitigationState = mitigation;
            PotentialHarm = potentialHarm;
            IsTeamMemberRisk = IsTeamMemberRisk;
        }

        public RiskObject()
        {

        }
    }
}
