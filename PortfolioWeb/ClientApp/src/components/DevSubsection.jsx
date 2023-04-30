import React, { useState,useEffect } from 'react';
import { Navbar, NavItem, NavLink, TabContent, TabPane } from 'reactstrap';
import { Link } from 'react-router-dom';
import { GetDevSubsectionElements } from './Utility';
import { CodeScript } from './CodeScript';
import { DevTool } from './DevTool';
import { TRYSQL } from './TRYSQL';
//import subsectionvideo from './videos/calculator-Win.mp4';

export function DevSubsection(props) {
    const subsection = props.subsection;
    const [activetab, setActiveTab] = useState(1);
    const [elements, setElements] = useState([]);
    useEffect(() => {
        (async () => {


            const elementsobj = await GetDevSubsectionElements();
            setElements(elementsobj);

        }
        )();
    }, []);

    if (elements.length == 0) { return <p>Loading...</p> }
  
    const code = subsection.devSubsectionCode;
    const subelements = elements.filter(e => e.devSubsectionCode == code);
    
    return (
        <div>
            <div className="row">
                <div className="col-md-6">
                <h5>{subsection.devSubsectionName}</h5>
                </div>
               
                <div className="col-md-6">
                    {subsection.gitHubRepoName?
                        <div><a href={subsection.gitHubRepoName} target="_blank" className="btn btn-info">Github Repo</a></div>
                        :
                        null
                    }
                </div>

            </div>
            <div>{subsection.devSubsectionDesc}</div>

            <div className="row"></div>
            <div className="col-md-12">
                <hr/>
                <DevTool toolType="" subsectioncode={code} />
                <hr />
            </div>
            <div className="row">
                <Navbar className="navbar-expand-sm">
                  <ul className="navbar-nav">
                    {subelements.map(e =>
                        <NavItem key={e.devSubsectionElementCode} tag={Link} to={{}} className={"btn mx-2 " + (activetab == e.devSubsectionElementSequence ? "btn-primary" : "btn-info")} onClick={() => setActiveTab(e.devSubsectionElementSequence)}>{e.buttonText}</NavItem>
                        )}
                        </ul>
                </Navbar>
                </div>
            <div className="row">
                <TabContent activeTab={activetab}>
                    {
                        subelements.map(e =>
                            <TabPane key={e.devSubsectionElementCode} tabId={e.devSubsectionElementSequence}>
                                {GetSubElement(e)}
                            </TabPane>
                            )
                    }
                </TabContent>
                </div>
            </div>
    )
}

function GetSubElement(e) {
    const fileurl = "/" + e.devSubsectionElementCode + "/" + e.devSubsectionCode + e.fileExtension;



    switch (e.htmlTag) {
        case "img":
            return <img src={fileurl} width="1000" />;
            break;
        case "iframe":
            return <CodeScript dirpath={fileurl} elementcode={e.devSubsectionElementCode} />;
            break;
        case "video":
            const subsectionvideo =  require("./videos/" + e.devSubsectionCode + ".mp4");
            return (
                <video key={e.devSubsectionCode} width="700" height="600" loop autoPlay muted>
                    <source src={subsectionvideo.default} type ="video/mp4" />
                    </video>
                )
            break;

        case "a":
            return (
                <a href={e.url} target="_new">Click here to see website</a>
                )
            break;
        case "trysql":
            return (
                < TRYSQL key={e.devSubsectionCode} dbname={e.devSubsectionCode} />
                ) 
            break;
    }
}