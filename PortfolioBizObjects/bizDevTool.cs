using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using CPUFramework;

namespace PortfolioBizObjects
{
    public class bizDevTool : bizObject<bizDevTool>
    {
        public string DevToolTypeCode { get; set; } = "";
        public string DevToolTypeName { get; set; } = "";
        public string DevToolCode { get; set; } = "";
        public string DevToolName { get; set; } = "";
        public bool HasIcon { get; set; }

        public string IconExt { get; set; } = "";


        //select
        //    t.DevToolId,
        //    dt.DevToolTypeName,
        //    t.DevToolCode,
        //    t.DevToolName,
        //    t.HasIcon
    }
}
