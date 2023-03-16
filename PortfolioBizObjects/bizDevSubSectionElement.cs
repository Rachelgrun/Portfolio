using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using CPUFramework;

namespace PortfolioBizObjects
{
    public class bizDevSubSectionElement: bizObject<bizDevSubSectionElement>
    {
        
        public int DevSubsectionId { get; set; }
        public string DevSubsectionCode { get; set; } = "";
        public string DevSubsectionElementCode { get; set; } = "";
        public string ButtonText { get; set; } = "";
        public string HtmlTag { get; set; } = "";
        public string FileExtension { get; set; } = "";
        public int DevSubsectionElementSequence { get; set; }
    }
}
