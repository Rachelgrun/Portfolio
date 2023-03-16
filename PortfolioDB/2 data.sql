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
    'Grunwald',
    'ruchiegrun@gmail.com',
    '(848)525-7485',
    'https://github.com/Rachelgrun',
    'I am a software developer who was trained in CPU Code School to produce top quality software. I am proficient in the full stack of software development, from requirements gathering to implementation of database, middle tier, and front end. This is done through the use of SQL Server, VB.Net, C#, ASP.Net, HTML, Bootstrap, Java Script, JQuery and more. Databases and websites are deployed to the cloud using Microsoft Azure. In fact, this website portfolio uses all the aforementioned technologies as described in each section. Go ahead take a look...'
go



insert DevToolType(DevToolTypeName,DevToolTypeName,DevToolTypeSequence,ShowHomePage)
select 'skill','My Skills',0,1
union select 'language','My Tools and Technologies',1,1


;
with x as(
      select t.DevToolTypeId,t.DevToolTypeName from DevToolType t
)

insert DevTool(DevToolName,DevToolSequenceNum,DevToolTypeId,HasIcon)
      select 'SQL', 1, x.DevToolTypeId,0 from x where x.DevToolTypeName ='language'
  union select 'SQL Server', 2, x.DevToolTypeId,0 from x where x.DevToolTypeName ='skill'
union select 'C#', 3, x.DevToolTypeId,0 from x where x.DevToolTypeName ='language'
union select 'Dapper', 4, x.DevToolTypeId,0 from x where x.DevToolTypeName  ='skill'
union select 'Software Architecture', 5, x.DevToolTypeId,0 from x where x.DevToolTypeName  ='skill'
union select 'Desktop Apps', 6, x.DevToolTypeId,0 from x where x.DevToolTypeName  ='skill'
union select 'ASP.Net', 7, x.DevToolTypeId,0 from x where x.DevToolTypeName ='language'
union select 'MVC', 8, x.DevToolTypeId,0 from x where x.DevToolTypeName ='skill'
union select 'HTML', 9, x.DevToolTypeId,0 from x where x.DevToolTypeName ='language'
union select 'CSS', 10, x.DevToolTypeId,0 from x where x.DevToolTypeName ='language'
union select 'Bootstrap', 11, x.DevToolTypeId,0 from x where x.DevToolTypeName ='language'
union select 'JavaScript', 12, x.DevToolTypeId,0 from x where x.DevToolTypeName ='language'
union select 'React', 13, x.DevToolTypeId,0 from x where x.DevToolTypeName ='language'
union select 'REST API''s', 14, x.DevToolTypeId,0 from x where x.DevToolTypeName ='skill'
union select 'Requirements Gathering', 15, x.DevToolTypeId,0 from x where x.DevToolTypeName ='skill'
union select 'Relational Database Schema Design', 16, x.DevToolTypeId,0 from x where x.DevToolTypeName ='skill'
union select 'Unit Testing', 17, x.DevToolTypeId,0 from x where x.DevToolTypeName ='skill'
union select 'Wireframes', 18, x.DevToolTypeId,0 from x where x.DevToolTypeName ='skill'
union select 'Quality Assurance', 19, x.DevToolTypeId,0 from x where x.DevToolTypeName ='skill'
union select 'Rollout', 20, x.DevToolTypeId,0 from x where x.DevToolTypeName ='skill'
union select 'JQuery',21, x.DevToolTypeId,0 from x where x.DevToolTypeName ='language'
union select 'Git', 22, x.DevToolTypeId,0 from x where x.DevToolTypeName='skill'
union select 'GitHub',23, x.DevToolTypeId,0 from x where x.DevToolTypeName ='skill'
union select 'Requirement Analysis',24, x.DevToolTypeId,0 from x where x.DevToolTypeName ='skill'
union select 'Database Schema Design',25, x.DevToolTypeId,0 from x where x.DevToolTypeName ='skill'
union select 'CRUD',26, x.DevToolTypeId,0 from x where x.DevToolTypeName ='skill'
union select 'Stored Procedures',27, x.DevToolTypeId,0 from x where x.DevToolTypeName ='skill'
union select 'Cloud Computing',28, x.DevToolTypeId,0 from x where x.DevToolTypeName ='skill'


update DevTool set HasIcon = 1 where DevToolName in ('C#','ASP.Net','Bootstrap','JQuery','CSS','HTML','JavaScript','React')

insert DevSection(DevSectionCode, DevSectionName, DevSectionOverview, DevSectionBlurb, HasPicture, DevSectionSequenceNum)
      select 'DB-Schemas','DB Schemas', 'Databases are the foundation of a software system. A strong database with constraints, foreign keys, functions, and stored procedures produces a system that is safe and secure.', 'Each database is handwritten using constraints,foreign keys, functions, and stored procedures to produce a safe and secure system.', 1, 0
union select 'Framework-Business-Objects', 'Framework/Business Objects', 'Creating a framework and Business Objects in a program makes the development easier, smoother and have cleaner code.', 'Creating a framework and Business Objects in a program makes the production easier, smoother and have cleaner code.', 0,1
union select 'Windows-Projects', 'Windows Projects', 'Windows programs are created using VB.Net and C#. They can be downloaded onto any computer.', 'Windows programs are created using object VB.Net and C#.', 0,2
union select 'Web-Projects', 'Web Projects', 'Web programs are created using HTML, ASP.Net, MVC, Java Script and JQuery.', 'Web apps are created using HTML, ASP.Net, MVC, JavaScript and JQuery.', 0, 3
go

insert DevSectionTool(DevSectionId, DevToolId)
      select (select ds.DevSectionId from DevSection ds where ds.DevSectionCode = 'DB-Schemas'), (select dt.DevToolId from DevTool dt where dt.DevToolName = 'SQL')
union select (select ds.DevSectionId from DevSection ds where ds.DevSectionCode = 'DB-Schemas'), (select dt.DevToolId from DevTool dt where dt.DevToolName = 'SQL Server')
union select (select ds.DevSectionId from DevSection ds where ds.DevSectionCode = 'DB-Schemas'), (select dt.DevToolId from DevTool dt where dt.DevToolName = 'Requirements Gathering')
union select (select ds.DevSectionId from DevSection ds where ds.DevSectionCode = 'DB-Schemas'), (select dt.DevToolId from DevTool dt where dt.DevToolName = 'Relational Database Schema Design')
union select (select ds.DevSectionId from DevSection ds where ds.DevSectionCode = 'DB-Schemas'), (select dt.DevToolId from DevTool dt where dt.DevToolName = 'Quality Assurance')
union select (select ds.DevSectionId from DevSection ds where ds.DevSectionCode = 'DB-Schemas'), (select dt.DevToolId from DevTool dt where dt.DevToolName = 'Rollout')
union select (select ds.DevSectionId from DevSection ds where ds.DevSectionCode = 'Framework-Business-Objects'), (select dt.DevToolId from DevTool dt where dt.DevToolName = 'Stored Procedures')
union select (select ds.DevSectionId from DevSection ds where ds.DevSectionCode = 'Framework-Business-Objects'), (select dt.DevToolId from DevTool dt where dt.DevToolName = 'C#')
union select (select ds.DevSectionId from DevSection ds where ds.DevSectionCode = 'Framework-Business-Objects'), (select dt.DevToolId from DevTool dt where dt.DevToolName = 'Dapper')
union select (select ds.DevSectionId from DevSection ds where ds.DevSectionCode = 'Framework-Business-Objects'), (select dt.DevToolId from DevTool dt where dt.DevToolName = 'Software Architecture')
union select (select ds.DevSectionId from DevSection ds where ds.DevSectionCode = 'Windows-Projects'), (select dt.DevToolId from DevTool dt where dt.DevToolName = 'Stored Procedures')
union select (select ds.DevSectionId from DevSection ds where ds.DevSectionCode = 'Windows-Projects'), (select dt.DevToolId from DevTool dt where dt.DevToolName = 'C#')
union select (select ds.DevSectionId from DevSection ds where ds.DevSectionCode = 'Windows-Projects'), (select dt.DevToolId from DevTool dt where dt.DevToolName = 'Dapper')
union select (select ds.DevSectionId from DevSection ds where ds.DevSectionCode = 'Windows-Projects'), (select dt.DevToolId from DevTool dt where dt.DevToolName = 'Software Architecture')
union select (select ds.DevSectionId from DevSection ds where ds.DevSectionCode = 'Windows-Projects'), (select dt.DevToolId from DevTool dt where dt.DevToolName = 'Desktop Apps')
union select (select ds.DevSectionId from DevSection ds where ds.DevSectionCode = 'Windows-Projects'), (select dt.DevToolId from DevTool dt where dt.DevToolName = 'Unit Testing')
union select (select ds.DevSectionId from DevSection ds where ds.DevSectionCode = 'Windows-Projects'), (select dt.DevToolId from DevTool dt where dt.DevToolName = 'Wireframes')
union select (select ds.DevSectionId from DevSection ds where ds.DevSectionCode = 'Windows-Projects'), (select dt.DevToolId from DevTool dt where dt.DevToolName = 'Quality Assurance')
union select (select ds.DevSectionId from DevSection ds where ds.DevSectionCode = 'Windows-Projects'), (select dt.DevToolId from DevTool dt where dt.DevToolName = 'Rollout')
union select (select ds.DevSectionId from DevSection ds where ds.DevSectionCode = 'Web-Projects'), (select dt.DevToolId from DevTool dt where dt.DevToolName = 'Software Architecture')
union select (select ds.DevSectionId from DevSection ds where ds.DevSectionCode = 'Web-Projects'), (select dt.DevToolId from DevTool dt where dt.DevToolName = 'ASP.Net')
union select (select ds.DevSectionId from DevSection ds where ds.DevSectionCode = 'Web-Projects'), (select dt.DevToolId from DevTool dt where dt.DevToolName = 'MVC')
union select (select ds.DevSectionId from DevSection ds where ds.DevSectionCode = 'Web-Projects'), (select dt.DevToolId from DevTool dt where dt.DevToolName = 'HTML')
union select (select ds.DevSectionId from DevSection ds where ds.DevSectionCode = 'Web-Projects'), (select dt.DevToolId from DevTool dt where dt.DevToolName = 'CSS')
union select (select ds.DevSectionId from DevSection ds where ds.DevSectionCode = 'Web-Projects'), (select dt.DevToolId from DevTool dt where dt.DevToolName = 'Bootstrap')
union select (select ds.DevSectionId from DevSection ds where ds.DevSectionCode = 'Web-Projects'), (select dt.DevToolId from DevTool dt where dt.DevToolName = 'JavaScript')
union select (select ds.DevSectionId from DevSection ds where ds.DevSectionCode = 'Web-Projects'), (select dt.DevToolId from DevTool dt where dt.DevToolName = 'React')
union select (select ds.DevSectionId from DevSection ds where ds.DevSectionCode = 'Web-Projects'), (select dt.DevToolId from DevTool dt where dt.DevToolName = 'REST API''s')
union select (select ds.DevSectionId from DevSection ds where ds.DevSectionCode = 'Web-Projects'), (select dt.DevToolId from DevTool dt where dt.DevToolName = 'Quality Assurance')
union select (select ds.DevSectionId from DevSection ds where ds.DevSectionCode = 'Web-Projects'), (select dt.DevToolId from DevTool dt where dt.DevToolName = 'Rollout')
union select (select ds.DevSectionId from DevSection ds where ds.DevSectionCode = 'Web-Projects'), (select dt.DevToolId from DevTool dt where dt.DevToolName = 'JQuery')
go

insert DevSubsection( DevSectionId, DevSubsectionCode, DevSubsectionName, GitHubRepoName, DevSubsectionDesc, DevSubSectionSequence)
      select (select ds.DevSectionId from DevSection ds where ds.DevSectionCode = 'DB-Schemas'), 'US-Gov-DB', 'US Gov', 'rgrunwald-US-Gov', 'The US Gov database has all our 45 presidents, 52 states, presidential executive orders, US Departments, US Budget and more.',1
union select (select ds.DevSectionId from DevSection ds where ds.DevSectionCode = 'DB-Schemas'), 'Book-Store-DB', 'Book Store', 'rgrunwald-BookstoreDB', 'The Book Store database was designed to handle the organization of books (some of them having multiple genres), into various shelves in different stores.',2
union select (select ds.DevSectionId from DevSection ds where ds.DevSectionCode = 'DB-Schemas'), 'Recipes-DB', 'Recipes', 'rgrunwald-RecipeDB', 'The recipe database has a collection of variouse recipes and was created to support the reorganization of these recipes into multi-course meals and cookbooks via different users.',3
union select (select ds.DevSectionId from DevSection ds where ds.DevSectionCode = 'DB-Schemas'), 'Portfolio-DB', 'Portfolio', 'rgrunwald-PortfolioDB', 'The portfolio database was designed to organize all the information on this website.',4
union select (select ds.DevSectionId from DevSection ds where ds.DevSectionCode = 'Framework-Business-Objects'), 'Framework', 'Framework', 'rgrunwald-framework', 'When writing programs, it is essential to create and work with a framework. A framework is a project where common and re-usable code is stored. It is written in a way that it can be used anywhere at anytime. Code such as logins, connection strings and data types are just a few of the many components written up in a framework.',5
union select (select ds.DevSectionId from DevSection ds where ds.DevSectionCode = 'Framework-Business-Objects'), 'bizObject', 'bizObject', 'rgrunwald-bizobject', 'Business objects are written as an inheritance of a bizObject which is written up in the framework. Business Objects are what make the system blend with the data from the database. For every project, a unique library of business objects is formed to work with its specific data.',6
union select (select ds.DevSectionId from DevSection ds where ds.DevSectionCode = 'Framework-Business-Objects'), 'sqlUtility', 'sqlUtility', 'rgrunwald-sqlutility', 'sqlUtility is a class where general utilites are written up so that they can be used for any program. It sets up connection strings, gets a data table from a stored procedure or a sql statement, parses out the error messages from the constraints, and much more.',7
union select (select ds.DevSectionId from DevSection ds where ds.DevSectionCode = 'Windows-Projects'), 'tic-tac-toe-Win', 'Tic Tac Toe', 'TicTacToeApp', 'The traditional tic-tac-toe game with both 1 and 2 player options.',8
union select (select ds.DevSectionId from DevSection ds where ds.DevSectionCode = 'Windows-Projects'), 'calculator-Win', 'Calculator', 'CalculatorApp2', 'This calculator has full functionality of the four basic mathematical functions. It handles negative factors, the division by zero error, and has friendly messages to correct the user when the equation is not complete (and the user tries to calculate it).',9
union select (select ds.DevSectionId from DevSection ds where ds.DevSectionCode = 'Windows-Projects'), 'MemoryGame-Win', 'Memory', 'MemoryGame', 'This is an enhanced version of the traditional Memory game with hint, comments, and more!',10
union select (select ds.DevSectionId from DevSection ds where ds.DevSectionCode = 'Windows-Projects'), 'Recipe-Win', 'Recipe', 'rgrunwald-RecipeDB', 'The recipe project functions as a windows front-end for the recipe relational database.',11
union select (select ds.DevSectionId from DevSection ds where ds.DevSectionCode = 'Web-Projects'),'US-Gov-Web','US Gov', 'rgrunwald-US-Gov', 'Designed and published a web front end for the US-Gov database with a large variety of tools and functionality.',12
union select (select ds.DevSectionId from DevSection ds where ds.DevSectionCode = 'Web-Projects'),'Recipe-Web', 'Recipe To Go', 'rgrunwald-recipes', 'Designed and published a web front end for the Recipe database with a large variety of tools and functionality.',13
--union select (select ds.DevSectionId from DevSection ds where ds.DevSectionCode = 'Web-Projects'), 'MemoryGame-Web', 'Memory', 'rgrunwald-Memory', 'Designed a web front end with similar funtionality to the Memory winforms project.',14
union select (select ds.DevSectionId from DevSection ds where ds.DevSectionCode = 'Web-Projects'), 'calculator-Web', 'Calculator', 'rgrunwald-Calculator', 'Designed a web front end with similar funtionality to the Calculator winforms project.',15

go

;
with x as (
      select s.DevSectionCode,d.*
       from DevSubsection d
      join DevSection s 
      on s.DevSectionId = d.DevSectionId
) 
insert DevSubsectionElement( DevSubsectionId,DevSubsectionElementCode,ButtonText,HtmlTag,FileExtension,DevSubsectionElementPriority)

select  x.DevSubsectionId, 'dbschema','Schema Diagram','img','.png',1 from x where x.DevSectionCode = 'DB-Schemas' and x.DevSubsectionCode <> 'Book-Store-DB' and x.DevSubsectionCode <> 'US-Gov-DB'
union 
select x.DevSubsectionId,'sqlscript','SQL Script','iframe','.html', 2 from x where x.DevSectionCode = 'DB-Schemas'
union
 select x.DevSubsectionId,'wireframe','Wireframe','img','.png', 3 from x where x.DevSubsectionCode = 'tic-tac-toe-Win'
union
 select x.DevSubsectionId,'spec','Spec','iframe','.html', 4 from x where x.DevSubsectionCode = 'tic-tac-toe-Win'
  union
 select x.DevSubsectionId,'wireframe','Wireframe','img','.png', 3 from x where x.DevSubsectionCode = 'MemoryGame-Win'
 union
 select x.DevSubsectionId,'spec','Spec','iframe','.html', 5 from x where x.DevSubsectionCode = 'MemoryGame-Win'

;
  

insert DevSubsectionTool(DevSubsectionId, DevToolId)
select dss.DevSubsectionId, dt.DevToolId
from DevSubsection dss
cross join DevTool dt
where dss.DevSubsectionCode = 'US-Gov-DB' and dt.DevToolName in ('SQL - CRUD', 'SQL - Stored Procedures', 'Relational Database Schema Design', 'Quality Assurance', 'Rollout' )

union select dss.DevSubsectionId, dt.DevToolId
from DevSubsection dss
cross join DevTool dt
where dss.DevSubsectionCode = 'Book-Store-DB' and dt.DevToolName in ('SQL - CRUD', 'Requirements Gathering', 'Relational Database Schema Design', 'Quality Assurance', 'Rollout' )

union select dss.DevSubsectionId, dt.DevToolId
from DevSubsection dss
cross join DevTool dt
where dss.DevSubsectionCode = 'Recipes-DB' and dt.DevToolName in ('SQL - CRUD', 'SQL - Stored Procedures', 'Requirements Gathering', 'Relational Database Schema Design', 'Quality Assurance', 'Rollout' )

union select dss.DevSubsectionId, dt.DevToolId
from DevSubsection dss
cross join DevTool dt
where dss.DevSubsectionCode = 'Framework' and dt.DevToolName in ('SQL - Stored Procedures', 'C#', 'Dapper', 'Software Architecture')

union select dss.DevSubsectionId, dt.DevToolId
from DevSubsection dss
cross join DevTool dt
where dss.DevSubsectionCode = 'bizObject' and dt.DevToolName in ('C#', 'Software Architecture')

union select dss.DevSubsectionId, dt.DevToolId
from DevSubsection dss
cross join DevTool dt
where dss.DevSubsectionCode = 'sqlUtility' and dt.DevToolName in ('SQL - Stored Procedures', 'C#', 'Dapper', 'Software Architecture')

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
where dss.DevSubsectionCode = 'Memory-Win' and dt.DevToolName in ('C#', 'Desktop Apps', 'Unit Testing', 'Wireframes', 'Quality Assurance', 'Rollout')

union select dss.DevSubsectionId, dt.DevToolId
from DevSubsection dss
cross join DevTool dt
where dss.DevSubsectionCode = 'Recipe-Win' and dt.DevToolName in ('SQL - Stored Procedures', 'C#', 'Dapper', 'Software Architecture', 'Desktop Apps', 'Unit Testing', 'Quality Assurance', 'Rollout')

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
where dss.DevSubsectionCode = 'calculator-Web' and dt.DevToolName in ('HTML', 'CSS', 'Bootstrap', 'JavaScript', 'JQuery', 'Quality Assurance')
