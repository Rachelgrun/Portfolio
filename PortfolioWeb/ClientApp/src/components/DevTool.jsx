import React, { useState, useEffect } from 'react';
import { GetDevTools } from './Utility';
 

export function DevTool(props){
    const [devtools, setDevTools] = useState([]);
    const tooltype = props.toolType;
    let caption = props.caption;
    const subsectioncode = props.subsectioncode;
    useEffect(() => {
        (async () => {
            console.log("subsectioncode", subsectioncode);
            const devtoolsobj = await GetDevTools(subsectioncode);
            setDevTools(devtoolsobj);
        }
        )();
    }, [subsectioncode]);
    if (devtools.length == 0) { return <p/>; }

    let tools = devtools;
    if (tooltype != "") {
        tools = devtools.filter(t => t.devToolTypeCode == tooltype);
    }

    console.log('devtool tools',tools)
    if (!caption) {caption = "Skills & Tech used for this project"}
    return (
        <ul className="list-group list-group-horizontal">
            <li className="list-group-item devtoolheader">{caption}</li>
            {tools.map(t => <li key={t.devToolCode} className="list-group-item text-bg-light bg-light border border-light">{GetTool(t)}</li>)}
                </ul>
        )
}

function GetTool(t) {
    

    if (t.hasIcon) {
        const imgpath = "/tool/" + t.devToolCode + "." + t.iconExt;
        return (

            <figure className="figure my-0">
            <img src={imgpath} className="figure-img img-fluid rounded" width="40"/>
            <figcaption className="figure-caption">{t.devToolName}</figcaption>
        </figure>
            )
    }
    else {
        return <span>{t.devToolName}</span>
    }
}