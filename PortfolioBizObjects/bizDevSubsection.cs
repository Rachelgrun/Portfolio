using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using CPUFramework;

namespace PortfolioBizObjects
{
    public class bizDevSubsection:bizObject<bizDevSubsection>
    {
   
        public int DevSectionId { get; set; }
        public string DevSectionCode { get; set; } = "";
        public string DevSubsectionCode { get; set; } = "";
        public string DevSubsectionName { get; set; } = "";
        public string DevSubsectionDesc { get; set; } = "";
        public string GitHubRepoName { get; set; } = "";
        public bool HasIcon { get; set; }
        public bool HasPicture { get; set; }
        public bool HasVideo { get; set; }
        public bool HasSpec { get; set; }
        public bool HasWireframe { get; set; }
        public int DevSubSectionSequence { get; set; }

    }
}
