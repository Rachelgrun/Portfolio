import React, { useState, useEffect } from 'react';
import { GetCodeScript } from './Utility';



export function CodeScript(props) {
    const [filecontents, setFilecontents] = useState("");
    const fileurl = props.dirpath;
    const elementcode = props.elementcode;
    useEffect(() => {
        (async () => {


            const filecontentsval = await GetCodeScript(fileurl, elementcode);
            setFilecontents(filecontentsval);

        }
        )();
    }, [fileurl]);

    if (filecontents == "") return <p>Loading...</p>;

    return (
        <div className="code" dangerouslySetInnerHTML={{ __html: filecontents }} />
        
    )
}