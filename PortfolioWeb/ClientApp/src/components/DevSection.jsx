import React, { useState, useEffect } from 'react';
import { useParams } from 'react-router-dom';
import { GetDevSections, GetDevSubsections } from './Utility';
import { DevSubsectionNav } from './DevSubsectionNav';
import { DevSubsection } from './DevSubsection';

function DevSection() {
    let params = useParams();
    //const id = params.id;
    //const sub = params.sub;
    let { id, sub } = params;
    console.log("devsection id", id);
    console.log("devsection sub", sub);
    const [devsections, setDevsections] = useState([]);
    const [devsubsections, setDevsubsections] = useState([]);

    useEffect(() => {
        (async () => {
         

            const devsectionsobj = await GetDevSections();
            setDevsections(devsectionsobj);

            const devsubsectionsobj = await GetDevSubsections();
            setDevsubsections(devsubsectionsobj);
        }
        )();
    }, []);


    if (devsections.length == 0 || devsubsections.length == 0) { return <p>Loading...</p> }
    const ds = devsections.filter(d => d.devSectionCode == id)[0];
    const dsubs = devsubsections.filter(s => s.devSectionCode == id);
    if (sub == null) { sub = dsubs[0].devSubsectionCode };
    const subsection = devsubsections.filter(s => s.devSubsectionCode == sub)[0];
    console.log(subsection);
    return(
        <div className="row">
            <div className="col-md-3">
                <DevSubsectionNav subsections={dsubs}/>
            </div>
            <div className="col-md-9">
                <div className="row">
                    <div className="col-md-3"><h4>{ds.devSectionName}</h4></div>
                    <div className="col-md-9 bg-dark text-light rounded">{ds.devSectionBlurb}</div>
                    <hr className="mt-2" />
                </div>
                <div className="row">
                    <div className="col-md-12">
                        <DevSubsection subsection={subsection} />
                    </div>
                </div>
            </div>

          
        </div>
        )
}

export default DevSection