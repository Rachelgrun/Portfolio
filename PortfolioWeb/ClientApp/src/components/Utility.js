

const baseurl = "/profile/";

export async function GetProfile() {
    const p = await FetchFromAPI("")
   
    return p;
}
export async function GetDevSections() {
    const d = await FetchFromAPI("devsections");
    return d;
}
export async function GetDevSubsections() {
    const d = await FetchFromAPI("devsubsections");
    return d;
}
export async function GetDevSubsectionElements() {
    const d = await FetchFromAPI("devsubsectionelements");
    return d;
}
export async function GetDevTools(DevSubsectionCode) {
    let url = "devtools";
    if (DevSubsectionCode != "" && DevSubsectionCode != null) {
        url = "devtoolsforsubsection?DevSubsectionCode=" + DevSubsectionCode;
    }
    const p = await FetchFromAPI(url);

    return p;
}
export async function GetDevToolTypes() {
    const d = await FetchFromAPI("devtooltypes");
    return d;
}

export async function GetDataTable(dbname, sql) {
 
    const t = await FetchFromAPI("trysql?dbname=" + dbname + "&sql=" + sql)
    return t;
}


async function FetchFromAPI(apiurl) {
    const resp = await fetch(baseurl + apiurl);
    const json_array = await resp.json();
   
    return json_array;
    console.log(json_array);
}

export async function GetCodeScript(fileurl,codetype) {

    let codescript = await FetchFromFile(fileurl);
    switch (codetype) {
        case "scriptsql":
            codescript = FormatSQLasHtml(codescript);
            break;
        case "scriptcsharp":
            codescript = FormatCSharpasHTML(codescript);
    }

    return codescript;
}



export async function FetchFromFile(fileurl) {
    const resp = await fetch(fileurl);
    let contents = await resp.text();
    return contents;
}

function DoFormatArray(wholevalue, classvalue, arrayvalue) {
    arrayvalue.forEach(x => wholevalue = DoFormat(wholevalue, x, classvalue))
    return wholevalue;
}

function DoFormat(wholevalue, findvalue, classvalue) {
    
    return wholevalue.replaceAll(findvalue, "<span class=\"" + classvalue + "\">" + findvalue + "</span>")
}
function FormatCSharpasHTML(code) {
    code = code.replace(/(?:\r\n|\r|\n)/g, '<br>');
   return DoFormatArray(code, "csharp", ["public class", "protected ", "private "]);

}


function FormatSQLasHtml(sql) {
    let s = sql.toString();
    s = s.replace(/(?:\r\n|\r|\n)/g, '<br>');
  
    s = s.replace("sys.databases", "<span class=\"sqlgreen\">sys.databases</span>");
    s = s.replace(/if /g, "<span class=\"sql\">if </span>");
    s = s.replace(/select/g, "<span class=\"sql\">select</span>");
    s = s.replace(/from/g, "<span class=\"sql\">from</span>");
    s = s.replace(/where/g, "<span class=\"sql\">where</span>");
    s = s.replace(/begin/g, "<span class=\"sql\">begin</span>");
    s = s.replace(/end/g, "<span class=\"sql\">end</span>");
    s = s.replace(/use /g, "<span class=\"sql\">use </span>");
    s = s.replace(/ int/g, "<span class=\"sql\"> int</span>");
    s = s.replace(/varchar/g, "<span class=\"sql\">varchar</span>");
    s = s.replace(/create database/g, "<span class=\"sql\">create database</span>");
    s = DoFormatArray(s, "sql", ["create table","primary key","identity"])
    
    s = s.replace(/foreign key references/g, "<span class=\"sql\">foreign key references</span>");
    s = s.replace(/datetime/g, "<span class=\"sql\">datetime</span>");
    s = s.replace(/date /g, "<span class=\"sql\">date </span>");
    s = s.replace(/go/g, "<span class=\"sql\"> go</span>");
    s = s.replace(/constraint/g, "<span class=\"sql-constraint\">constraint</span>");
    s = s.replace(/ unique/g, "<span class=\"sql\"> unique</span>");
    s = s.replace(/check/g, "<span class=\"sql\">check</span>");
    s = s.replace(/ as /g, "<span class=\"sql\"> as </span>");
    s = s.replace(/bit /g, "<span class=\"sql\">bit </span>");
    s = s.replace(/default /g, "<span class=\"sql\">default </span>");
    s = s.replace(/ char/g, "<span class=\"sql\"> char</span>");
    s = s.replace(/decimal/g, "<span class=\"sql\">decimal</span>");
    s = s.replace(/identifier /g, "<span class=\"sql\">identifier </span>");
    return s;
}