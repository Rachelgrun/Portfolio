﻿import React, { useState, useEffect, useRef } from 'react';
import { GetDataTable } from './Utility';

export function TRYSQL(props) {
    const dbname = props.dbname;
    const [results, setResults] = useState([]);
    const [sql, setSql] = useState("");
    const [errormsg, setErrormsg] = useState("");
    const txtsql = useRef(null);

    useEffect(() => {
        (async () => {

            if (sql != "") {
                const resultsobj = await GetDataTable(dbname, sql);
                if (Object.hasOwn(resultsobj, "errormsg")) {
                    setErrormsg(resultsobj.errormsg);
                    setResults(null);
                }
                else {
                    setResults(resultsobj);
                    setErrormsg("");
                }
                

            }
        }
        )();
    }, [sql]);


    console.log("try sql results", results);
    return (
        <div>
            <div className="row">
                <div className="col-md-12">
                    <textarea className="trysqlcode" ref={txtsql} cols="100" rows="4" />
                </div>
            </div>
            <div className="row">
                <div className="col-md-3">
                    <button className="btn btn-success" onClick={() => setSql(txtsql.current.value)}>Run SQL</button>
                    </div>
            </div>
            <div className="row my-4">
                <div className="h3 bg-danger">{errormsg} </div>

               
               
            </div>
            <div className="row">
                <div className="col-md-12">
                    {(results !=null && results.length >0) ?
                        <table className="table">
                            <tbody>
                                <tr>{Object.keys(results[0]).map((col, index) => <th key={index}>{col}</th>)}</tr>
                                {results.map((item, index) => <tr key={index}>
                                    {Object.values(item).map((value, valueindex) => <td key={valueindex}>{value}</td>)}
                                </tr>)}
                            </tbody>
                        </table>
                        : null 
                    }
                </div>
            </div>


        </div>
    )
}