--AS Great job! 100%
use PortfolioDB
go


delete DevSubSectionTool
delete DevSubsectionElement
delete DevSubSection
delete DevSectionTool
delete DevSection
delete DevTool
delete DevToolType
delete Profile
go

insert Profile(FirstName, LastName, EmailAddress, PhoneNumber, GitHubAccount, ProfileDesc)
select 
    'Ruchie',
    'Brisman',
    'ruchiegrun@gmail.com',
    '(848)525-7485',
    'https://github.com/Rachelgrun',
    'I am a software developer who was trained in CPU Code School to produce top quality software. I am proficient in the full stack of software development, from requirements gathering to implementation of database, middle tier, and front end. This is done through the use of SQL Server, VB.Net, C#, ASP.Net, HTML, Bootstrap, Java Script, JQuery and more. Databases and websites are deployed to the cloud using Microsoft Azure. In fact, this website portfolio uses all the aforementioned technologies as described in each section. Go ahead take a look...'
go



insert DevToolType(DevToolTypeCode,DevToolTypeName,DevToolTypeSequence,ShowHomePage)
select 'language','My Tech',0,1
union select 'skill','My Skills',1,1
union select 'devtool','My Dev Tools',2,1

;
with x as(
      select t.DevToolTypeId,t.DevToolTypeCode from DevToolType t
)

insert DevTool(DevToolName,DevToolSequenceNum,DevToolTypeId,HasIcon)
      select 'SQL', 1, x.DevToolTypeId,1 from x where x.DevToolTypeCode ='language'
  union select 'C#', 2, x.DevToolTypeId,0 from x where x.DevToolTypeCode ='language'
union select 'Dapper', 3, x.DevToolTypeId,1 from x where x.DevToolTypeCode  ='language'
union select 'HTML', 4, x.DevToolTypeId,0 from x where x.DevToolTypeCode ='language'
union select 'ASP.Net', 5, x.DevToolTypeId,0 from x where x.DevToolTypeCode ='language'
union select 'JavaScript', 6, x.DevToolTypeId,0 from x where x.DevToolTypeCode ='language'
union select 'Bootstrap', 7, x.DevToolTypeId,0 from x where x.DevToolTypeCode ='language'
union select 'CSS', 8, x.DevToolTypeId,0 from x where x.DevToolTypeCode ='language'
union select 'JQuery',9, x.DevToolTypeId,0 from x where x.DevToolTypeCode ='language'
union select 'React', 10, x.DevToolTypeId,0 from x where x.DevToolTypeCode ='language'
union select 'SQL Server', 11, x.DevToolTypeId,0 from x where x.DevToolTypeCode ='devtool'
union select 'Requirement Analysis',12, x.DevToolTypeId,0 from x where x.DevToolTypeCode ='skill'
union select 'Wireframes', 13, x.DevToolTypeId,0 from x where x.DevToolTypeCode ='skill'
union select 'Relational Database Schema Design', 15, x.DevToolTypeId,0 from x where x.DevToolTypeCode ='skill'
union select 'CRUD with stored Procedures',16, x.DevToolTypeId,0 from x where x.DevToolTypeCode ='skill'
union select 'Software System Framework', 17, x.DevToolTypeId,0 from x where x.DevToolTypeCode  ='skill'
union select 'Unit Testing', 18, x.DevToolTypeId,0 from x where x.DevToolTypeCode ='skill'
union select 'Cloud Computing',19, x.DevToolTypeId,0 from x where x.DevToolTypeCode ='skill'
union select 'Visual Studio', 20, x.DevToolTypeId,0 from x where x.DevToolTypeCode ='devtool'
union select 'Azure Data Studio', 21, x.DevToolTypeId,0 from x where x.DevToolTypeCode ='devtool'
union select 'SQL Server Management Studio', 22, x.DevToolTypeId,0 from x where x.DevToolTypeCode ='devtool'
union select 'Beyond Compare', 23, x.DevToolTypeId,0 from x where x.DevToolTypeCode ='devtool'
union select 'Git', 24, x.DevToolTypeId,0 from x where x.DevToolTypeCode='devtool'
union select 'GitHub',25, x.DevToolTypeId,0 from x where x.DevToolTypeCode ='devtool'
union select 'Quality Assurance', 26, x.DevToolTypeId,0 from x where x.DevToolTypeCode ='skill'
union select 'Rollout', 27, x.DevToolTypeId,0 from x where x.DevToolTypeCode ='skill'

update DevTool set HasIcon = 1 where DevToolName in ('C#','ASP.Net','Bootstrap','JQuery','CSS','HTML','JavaScript','React')
update DevTool set IconExt = 'png' where DevToolName = 'Dapper'


insert DevSection(DevSectionCode, DevSectionName, DevSectionOverview, DevSectionBlurb, HasPicture, DevSectionSequenceNum)
      select 'DB-Schemas','DB Schemas', 'Databases are the foundation of a software system. A strong database with constraints, foreign keys, functions, and stored procedures produces a system that is safe and secure.', 'Each database is handwritten using constraints,foreign keys, functions, and stored procedures to produce a safe and secure system.', 1, 0
union select 'Architecture', 'Architecture', 'Creating a framework and Business Objects in a program makes the development easier, smoother and have cleaner code.', 'Creating a framework and Business Objects in a program makes the production easier, smoother and have cleaner code.', 0,1
union select 'Windows-Projects', 'Windows Projects', 'Windows programs are created using VB.Net and C#. They can be downloaded onto any computer.', 'Windows programs are created using object VB.Net and C#.', 0,2
union select 'Web-Projects', 'Web Projects', 'Web programs are created using HTML, ASP.Net, MVC, Java Script and JQuery.', 'Web apps are created using HTML, ASP.Net, MVC, JavaScript and JQuery.', 0, 3
go

insert DevSectionTool(DevSectionId, DevToolId)
      select (select ds.DevSectionId from DevSection ds where ds.DevSectionCode = 'DB-Schemas'), (select dt.DevToolId from DevTool dt where dt.DevToolName = 'SQL')
union select (select ds.DevSectionId from DevSection ds where ds.DevSectionCode = 'DB-Schemas'), (select dt.DevToolId from DevTool dt where dt.DevToolName = 'SQL Server')
union select (select ds.DevSectionId from DevSection ds where ds.DevSectionCode = 'DB-Schemas'), (select dt.DevToolId from DevTool dt where dt.DevToolName = 'Relational Database Schema Design')
union select (select ds.DevSectionId from DevSection ds where ds.DevSectionCode = 'DB-Schemas'), (select dt.DevToolId from DevTool dt where dt.DevToolName = 'Quality Assurance')
union select (select ds.DevSectionId from DevSection ds where ds.DevSectionCode = 'DB-Schemas'), (select dt.DevToolId from DevTool dt where dt.DevToolName = 'Rollout')
union select (select ds.DevSectionId from DevSection ds where ds.DevSectionCode = 'Architecture'), (select dt.DevToolId from DevTool dt where dt.DevToolName = 'C#')
union select (select ds.DevSectionId from DevSection ds where ds.DevSectionCode = 'Architecture'), (select dt.DevToolId from DevTool dt where dt.DevToolName = 'Dapper')
union select (select ds.DevSectionId from DevSection ds where ds.DevSectionCode = 'Architecture'), (select dt.DevToolId from DevTool dt where dt.DevToolName = 'Software System Framework')
union select (select ds.DevSectionId from DevSection ds where ds.DevSectionCode = 'Windows-Projects'), (select dt.DevToolId from DevTool dt where dt.DevToolName = 'C#')
union select (select ds.DevSectionId from DevSection ds where ds.DevSectionCode = 'Windows-Projects'), (select dt.DevToolId from DevTool dt where dt.DevToolName = 'Dapper')
union select (select ds.DevSectionId from DevSection ds where ds.DevSectionCode = 'Windows-Projects'), (select dt.DevToolId from DevTool dt where dt.DevToolName = 'Software System Framework')
union select (select ds.DevSectionId from DevSection ds where ds.DevSectionCode = 'Windows-Projects'), (select dt.DevToolId from DevTool dt where dt.DevToolName = 'Unit Testing')
union select (select ds.DevSectionId from DevSection ds where ds.DevSectionCode = 'Windows-Projects'), (select dt.DevToolId from DevTool dt where dt.DevToolName = 'Wireframes')
union select (select ds.DevSectionId from DevSection ds where ds.DevSectionCode = 'Windows-Projects'), (select dt.DevToolId from DevTool dt where dt.DevToolName = 'Quality Assurance')
union select (select ds.DevSectionId from DevSection ds where ds.DevSectionCode = 'Windows-Projects'), (select dt.DevToolId from DevTool dt where dt.DevToolName = 'Rollout')
union select (select ds.DevSectionId from DevSection ds where ds.DevSectionCode = 'Web-Projects'), (select dt.DevToolId from DevTool dt where dt.DevToolName = 'Software System Framework')
union select (select ds.DevSectionId from DevSection ds where ds.DevSectionCode = 'Web-Projects'), (select dt.DevToolId from DevTool dt where dt.DevToolName = 'ASP.Net')
union select (select ds.DevSectionId from DevSection ds where ds.DevSectionCode = 'Web-Projects'), (select dt.DevToolId from DevTool dt where dt.DevToolName = 'HTML')
union select (select ds.DevSectionId from DevSection ds where ds.DevSectionCode = 'Web-Projects'), (select dt.DevToolId from DevTool dt where dt.DevToolName = 'CSS')
union select (select ds.DevSectionId from DevSection ds where ds.DevSectionCode = 'Web-Projects'), (select dt.DevToolId from DevTool dt where dt.DevToolName = 'Bootstrap')
union select (select ds.DevSectionId from DevSection ds where ds.DevSectionCode = 'Web-Projects'), (select dt.DevToolId from DevTool dt where dt.DevToolName = 'JavaScript')
union select (select ds.DevSectionId from DevSection ds where ds.DevSectionCode = 'Web-Projects'), (select dt.DevToolId from DevTool dt where dt.DevToolName = 'React')
union select (select ds.DevSectionId from DevSection ds where ds.DevSectionCode = 'Web-Projects'), (select dt.DevToolId from DevTool dt where dt.DevToolName = 'Quality Assurance')
union select (select ds.DevSectionId from DevSection ds where ds.DevSectionCode = 'Web-Projects'), (select dt.DevToolId from DevTool dt where dt.DevToolName = 'Rollout')
union select (select ds.DevSectionId from DevSection ds where ds.DevSectionCode = 'Web-Projects'), (select dt.DevToolId from DevTool dt where dt.DevToolName = 'JQuery')
go


/*
 select d.DevSectionId, 'cpuframework', 'CPUFramework','CPUFramework', 'CPUFramework...', 4 from DevSection d where d.DevSectionCode = 'Architecture'
union select d.DevSectionId, 'bizobject','bizObject','CPUFramework',  'BizObject is the generic business object defined in CPUFramework. It maintains the dialogue between database
tables and user inputs, necessary to bind, save, load, and present data. A system using CPUFramework has library of business objects that inherit from the
generic BizObject.', 4 from DevSection d where d.DevSectionCode = 'Architecture'
union
select d.DevSectionId,  'datautility','DataUtility','CPUFramework', 'DataUtility is a module or static class which sets up the connection string throughout the program in order to
properly data drive the code.', 6 from DevSection d where d.DevSectionCode = 'Architecture'
union
select d.DevSectionId,  'sqlutility','SQLUtility','CPUFramework', 'SQLUtility is a module, or static class, that stores general utilities that can be used for any program. It returns data
tables from a stored procedure or SQL statement, parses error messages, and hosts much other shared code.', 7 from DevSection d where d.DevSectionCode =
'Architecture'
union
select d.DevSectionId,  'cpuexception','CPUException','CPUFramework', 'CPUException inherits from Exception and provides custom error handling for validation.', 8 from
DevSection d where d.DevSectionCode = 'Architecture'
*/



insert DevSubsection( DevSectionId, DevSubsectionCode, DevSubsectionName, GitHubRepoName,URL, DevSubsectionDesc, DevSubSectionSequence)
      select (select ds.DevSectionId from DevSection ds where ds.DevSectionCode = 'DB-Schemas'), 'RecordKeeperDB', 'US Gov', 'RecordKeeper','', 'The US Gov database has all our 45 presidents, 52 states, presidential executive orders, US Departments, US Budget and more.',3

union select (select ds.DevSectionId from DevSection ds where ds.DevSectionCode = 'DB-Schemas'), 'RecipeDB', 'Recipe', 'Recipe','', 'The recipe database has a collection of variouse recipes and was created to support the reorganization of these recipes into multi-course meals and cookbooks via different users.',1
union select (select ds.DevSectionId from DevSection ds where ds.DevSectionCode = 'DB-Schemas'), 'PortfolioDB', 'Portfolio', 'Portfolio','', 'The portfolio database was designed to organize all the information on this website.',2
union select (select ds.DevSectionId from DevSection ds where ds.DevSectionCode = 'Architecture'), 'cpuexception', 'CPUException','CPUFramework','','CPUException inherits from Exception and provides custom error handling for validation.', 4
union select (select ds.DevSectionId from DevSection ds where ds.DevSectionCode = 'Architecture'), 'cpuframework', 'CPUFramework', 'CPUFramework','','A reusable code framework is the hallmark of a strong software system. This custom framework was produced using Dapper to make the development easier, smoother, and less error prone with centralized reusable code tailored specifically for the business needs.',3
union select (select ds.DevSectionId from DevSection ds where ds.DevSectionCode = 'Architecture'), 'bizObject', 'bizObject', 'CPUFramework','', 'BizObject is the generic business object defined in CPUFramework. It maintains the dialogue between databasetables and user inputs, necessary to bind, save, load, and present data.',6
union select (select ds.DevSectionId from DevSection ds where ds.DevSectionCode = 'Architecture'), 'sqlUtility', 'SQLUtility','CPUFramework','','SQLUtility is a module, or static class, that stores general utilities that can be used for any program. It returns data tables from a stored procedure or SQL statement, parses error messages, and hosts much other shared code.',7
union select (select ds.DevSectionId from DevSection ds where ds.DevSectionCode = 'Windows-Projects'), 'tic-tac-toe-Win', 'Tic Tac Toe', 'TicTacToeApp','', 'The traditional tic-tac-toe game with both 1 and 2 player options.',9
union select (select ds.DevSectionId from DevSection ds where ds.DevSectionCode = 'Windows-Projects'), 'calculator-Win', 'Calculator', 'CalculatorApp2','', 'This calculator has full functionality of the four basic mathematical functions. It handles negative factors, the division by zero error, and has friendly messages to correct the user when the equation is not complete (and the user tries to calculate it).',10
union select (select ds.DevSectionId from DevSection ds where ds.DevSectionCode = 'Windows-Projects'), 'MemoryGame-Win', 'Memory', 'MemoryGame','', 'This is an enhanced version of the traditional Memory game with hint, comments, and more!',11
union select (select ds.DevSectionId from DevSection ds where ds.DevSectionCode = 'Web-Projects'),'US-Gov-Web','US Gov', 'RecordKeeper','https://recordkeeperweb20221001213612.azurewebsites.net/President', 'Designed and published a web front end for the US-Gov database with a large variety of tools and functionality.',13
union select (select ds.DevSectionId from DevSection ds where ds.DevSectionCode = 'Web-Projects'),'Recipe-Web', 'Recipe To Go', 'Recipe','https://recipetogo.azurewebsites.net/', 'Designed and published a web front end for the Recipe database with a large variety of tools and functionality.',14
--union select (select ds.DevSectionId from DevSection ds where ds.DevSectionCode = 'Web-Projects'), 'MemoryGame-Web', 'Memory', 'rgrunwald-Memory', 'Designed a web front end with similar funtionality to the Memory winforms project.',15
union select (select ds.DevSectionId from DevSection ds where ds.DevSectionCode = 'Web-Projects'), 'portfolio-Web', 'Portfolio', 'Portfolio','', 'Designed and published a web front end using the portfolio database.This project illustrates the many different skills and languages that were aquired.',17
go

;
with x as (
      select s.DevSectionCode,d.*
       from DevSubsection d
      join DevSection s 
      on s.DevSectionId = d.DevSectionId
) 
insert DevSubsectionElement( DevSubsectionId,DevSubsectionElementCode,ButtonText,HtmlTag,FileExtension,DevSubsectionElementPriority)

select  x.DevSubsectionId, 'dbschema','Schema Diagram','img','.png',1 from x where  x.DevSubsectionCode in ('RecipeDB','PortfolioDB')
union 
select x.DevSubsectionId,'scriptsql','SQL Script','iframe','.html', 2 from x where x.DevSectionCode = 'DB-Schemas'
union
 select x.DevSubsectionId,'wireframe','Wireframe','img','.png', 3 from x where x.DevSubsectionCode in ('tic-tac-toe-Win','MemoryGame-Win','bizObject', 'sqlUtility','cpuframework')

 union
 select x.DevSubsectionId,'spec','Spec','iframe','.html', 5 from x where x.DevSubsectionCode = 'MemoryGame-Win'
 union select x.DevSubsectionId, 'scriptcsharp', 'See Code', 'iframe', '.html', 2 from x where x.DevSectionCode = 'architecture'  and x.DevSubsectionCode <> 'cpuframework'
 union
 select x.DevSubsectionId,'video','Watch Video','video','.mp4', 4 from x where x.DevSectionCode ='Windows-Projects'
 union 
 select x.DevSubsectionId,'website','View Website','a','', 4 from x where x.DevSectionCode ='Web-Projects'
  union 
 select x.DevSubsectionId,'trysql','Try SQL','trysql','', 4 from x where x.DevSectionCode ='DB-Schemas'
 
;
  

insert DevSubsectionTool(DevSubsectionId, DevToolId)
select dss.DevSubsectionId, dt.DevToolId
from DevSubsection dss
cross join DevTool dt
where dss.DevSubsectionCode = 'RecordKeeperDB' and dt.DevToolName in ('SQL', 'CRUD with stored Procedures', 'Relational Database Schema Design', 'Quality Assurance', 'Rollout' )

union select dss.DevSubsectionId, dt.DevToolId
from DevSubsection dss
cross join DevTool dt
where dss.DevSubsectionCode = 'Book-Store-DB' and dt.DevToolName in ('SQL', 'Requirements Gathering', 'Relational Database Schema Design', 'Quality Assurance', 'Rollout' )

union select dss.DevSubsectionId, dt.DevToolId
from DevSubsection dss
cross join DevTool dt
where dss.DevSubsectionCode = 'RecipeDB' and dt.DevToolName in ('SQL', 'SQL - Stored Procedures', 'Requirements Gathering', 'Relational Database Schema Design', 'Quality Assurance', 'Rollout' )

union select dss.DevSubsectionId, dt.DevToolId
from DevSubsection dss
cross join DevTool dt
where dss.DevSubsectionCode = 'Framework' and dt.DevToolName in ('SQL', 'C#', 'Dapper', 'Software Architecture')

union select dss.DevSubsectionId, dt.DevToolId
from DevSubsection dss
cross join DevTool dt
where dss.DevSubsectionCode in  ('bizObject','cpuframework','sqlutility','datautility') and dt.DevToolName in ('SQL','C#', 'Software Architecture','Dapper')

union select dss.DevSubsectionId, dt.DevToolId
from DevSubsection dss
cross join DevTool dt
where dss.DevSubsectionCode = 'tic-tac-toe-Win' and dt.DevToolName in ('C#', 'Desktop Apps', 'Quality Assurance', 'Wireframes')

union select dss.DevSubsectionId, dt.DevToolId
from DevSubsection dss
cross join DevTool dt
where dss.DevSubsectionCode = 'calculator-Win' and dt.DevToolName in ('C#', 'Desktop Apps', 'Quality Assurance')

union select dss.DevSubsectionId, dt.DevToolId
from DevSubsection dss
cross join DevTool dt
where dss.DevSubsectionCode = 'MemoryGame-Win' and dt.DevToolName in ('C#', 'Desktop Apps', 'Unit Testing', 'Wireframes', 'Quality Assurance', 'Rollout')

union select dss.DevSubsectionId, dt.DevToolId
from DevSubsection dss
cross join DevTool dt
where dss.DevSubsectionCode = 'Recipe-Win' and dt.DevToolName in ('SQL', 'C#', 'Dapper', 'Software Architecture', 'Desktop Apps', 'Unit Testing', 'Quality Assurance', 'Rollout')

union select dss.DevSubsectionId, dt.DevToolId
from DevSubsection dss
cross join DevTool dt
where dss.DevSubsectionCode = 'US-Gov-Web' and dt.DevToolName in ('Software Architecture', 'ASP.Net', 'MVC', 'HTML', 'CSS', 'Bootstrap', 'JavaScript', 'JQuery', 'React', 'REST API''s', 'Quality Assurance', 'Rollout')

union select dss.DevSubsectionId, dt.DevToolId
from DevSubsection dss
cross join DevTool dt
where dss.DevSubsectionCode = 'Recipe-Web' and dt.DevToolName in ('Software Architecture', 'ASP.Net', 'MVC', 'HTML', 'CSS', 'Bootstrap', 'JavaScript', 'JQuery', 'React', 'REST API''s', 'Quality Assurance', 'Rollout')

union select dss.DevSubsectionId, dt.DevToolId
from DevSubsection dss
cross join DevTool dt
where dss.DevSubsectionCode = 'portfolio-Web' and dt.DevToolName in ('Software Architecture', 'ASP.Net', 'MVC', 'HTML', 'CSS', 'Bootstrap', 'JavaScript', 'JQuery', 'React', 'REST API''s', 'Quality Assurance', 'Rollout')
