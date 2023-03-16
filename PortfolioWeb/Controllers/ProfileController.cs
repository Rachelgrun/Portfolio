using Microsoft.AspNetCore.Mvc;
using PortfolioBizObjects;


namespace PortfolioWeb.Controllers
{
    [Route("[controller]")]
    [ApiController]
    public class ProfileController : ControllerBase
    {
        // GET: api/<ProfileController>
        [HttpGet]
        public bizProfile Get()
        {
            bizProfile profile = new();
            var lst = bizProfile.GetAll();
            if (lst.Count() > 0)
            {
                profile = lst[0];
            }
            return profile;
        }
       
        [HttpGet("devsections")]
        public List<bizDevSection> DevSectionGet()
        {
            var lst = bizDevSection.GetAll();
            return lst;
        }
        [HttpGet("devsubsections")]
        public List<bizDevSubsection> DevSubSectionGet()
        {
            var lst = bizDevSubsection.GetAll();
            return lst;
        }

        [HttpGet("devsubsectionelements")]
        public List<bizDevSubSectionElement>DevSubSectionElementGet()
        {
            var lst = bizDevSubSectionElement.GetAll();
            return lst;
        }
        [HttpGet("devtools")]
        public List<bizDevTool> DevToolGet()
        {
            return bizDevTool.GetAll();
        }
        [HttpGet("devtoolsforsubsection")]
        public List<bizDevTool> DevToolGetForSubsection(string DevSubsectionCode)
        {
            List<bizDevTool> lst = bizDevTool.GetList("DevSubsectionCode", DevSubsectionCode);

            return lst; }

     [HttpGet("devtooltypes")]
     public List<bizDevToolType> DevToolTypeGet()
        {
            return bizDevToolType.GetAll();
        }
    }
}

