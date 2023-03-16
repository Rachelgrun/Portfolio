import React, { useState, useEffect } from 'react';
import { GetProfile, GetDevSections, GetDevToolTypes } from './Utility';
import { DevTool } from './DevTool';

function Home() {
    const [profile, setProfile] = useState({});
    const [devsections, setDevsections] = useState([]);
    const [devtooltypes, setDevTooltypes] = useState([]);


    useEffect(() => {
        (async () => {
            const profileobj = await GetProfile();
            setProfile(profileobj);

            const devsectionsobj = await GetDevSections();
            setDevsections(devsectionsobj);

            const devtooltypesobj = await GetDevToolTypes();
            setDevTooltypes(devtooltypesobj);


        }
        )();
    }, []);



    if (profile.profileDesc == null || devsections.length == 0 || devtooltypes.length == 0) { return <p>Loading...</p> }
    const devtooltypesforhome = devtooltypes.filter(d => d.showHomePage == true)
    console.log("devtooltypesforhome", devtooltypesforhome);

    return (
        <div>

            <p className="bg-light m-5 p-3 h5">{profile.profileDesc}</p>


            {
                devtooltypesforhome.map(t => <div className="row my-2" key={t.devToolTypeCode}>
                    <div className="col-md-12">
                        <DevTool toolType={t.devToolTypeCode} caption={t.devToolTypeName} subsectionCode="" />
                    </div>
                </div>)

            }

            <div className="row">
                {devsections.map(d =>
                    <div key={d.devSectionCode} className="col-md-3">
                        <div className="card">
                            <div className="card-header">{d.devSectionName}</div>
                            <div className="card-body">{d.devSectionBlurb}</div>
                        </div>
                    </div>)}
            </div>
        </div>
    );

}
export default Home;
