using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using CPUFramework;

namespace PortfolioBizObjects
{
    public class bizDevToolType : bizObject<bizDevToolType>
    {
        
        public string DevToolTypeCode { get; set; } = "";
        public string DevToolTypeName { get; set; } = "";
        public int DevToolTypeSequence { get; set; }
        public bool ShowHomePage { get; set; }


    }
}
