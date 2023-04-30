
use PortfolioDB

go
drop table if exists DevSubsectionElement
drop table if exists DevSubSectionTool
drop table if exists DevSubSection
drop table if exists DevSectionTool
drop table if exists DevSection
drop table if exists DevTool
drop table if exists DevToolType
drop table if exists Profile
go






create table dbo.Profile(

    ProfileId int not null identity primary key,
    FirstName varchar(35) not null
        constraint ck_First_Name_cannot_be_blank check(FirstName <> ''),
    LastName varchar(35) not null
        constraint ck_Last_Name_cannot_be_blank check(LastName <> ''),
    EmailAddress varchar(100) not null constraint u_Profile_EmailAddress unique,
        constraint ck_Email_Address_cannot_be_blank check(EmailAddress <> ''),
    PhoneNumber varchar(14) not null constraint u_Profile_PhoneNumber unique,
    GitHubAccount varchar(100) not null constraint u_Profile_GitHubAccount unique,
        constraint ck_GitHub_Account_cannot_be_blank check(GitHubAccount <> ''),
    ProfileDesc varchar(1000) not null
        constraint ck_Profile_Desc_cannot_be_blank check(ProfileDesc <> ''),
    HasResume bit not null default 1
)
go

create table dbo.DevToolType(
DevToolTypeId int not null  identity primary key,
DevToolTypeCode varchar(25) not null constraint u_DevToolType_code unique,
DevToolTypeName varchar(100) not null
 constraint ck_DevToolTypeName_cannot_be_blank check(DevToolTypeName <> '')
 constraint u_DevToolType_Name unique,
 DevToolTypeSequence int not null,
 ShowHomePage bit not null 
)
go

create table dbo.DevTool(
    DevToolId int not null identity primary key,
    DevToolTypeId int not null constraint f_DevToolType_DevTool foreign key references DevToolType(DevToolTypeId),
    DevToolCode as replace(replace(replace(lower(DevToolName),' ',''),'.',''),'#','') constraint u_DevTool_DevToolCode unique,
    DevToolName varchar(50) not null constraint u_DevTool_DevToolName unique,
        constraint ck_Dev_Tool_Name_cannot_be_blank check(DevToolName <> ''),
    DevToolSequenceNum int not null constraint u_DevTool_SequenceNum unique,
    HasIcon bit not null default 0,
    IconExt varchar(3) not null default 'svg'
)
go

create table dbo.DevSection(
    DevSectionId int not null identity primary key,
    DevSectionCode varchar(50) not null constraint u_DevSection_DevSectionCode unique,
        constraint ck_Dev_Section_Code_cannot_be_blank check(DevSectionCode <> ''),
    DevSectionName varchar(35) not null constraint u_DevSection_DevSectionName unique,
        constraint ck_Dev_Section_Name_cannot_be_blank check(DevSectionName <> ''),
    DevSectionOverview varchar(500) not null
        constraint ck_Dev_Section_Overview_cannot_be_blank check(DevSectionOverview <> ''),
    DevSectionBlurb varchar(500) not null
        constraint ck_Dev_Section_Blurb_cannot_be_blank check(DevSectionBlurb <> ''),
    HasPicture bit not null default 0,
    DevSectionSequenceNum int not null constraint u_DevSection_SequenceNum unique
)
go

create table dbo.DevSectionTool(
    DevSectionToolId int not null identity primary key,
    DevSectionId int not null constraint fk_DevSection_DevSectionTool foreign key references DevSection(DevSectionId),
    DevToolId int not null constraint fk_DevTool_DevSectionTool foreign key references DevTool(DevToolId),
        constraint u_DevSectionTool_DevSectionId_DevToolId unique(DevSectionId, DevToolId)
)
go

create table dbo.DevSubsection(
    DevSubsectionId int not null identity primary key,
    DevSectionId int not null constraint fk_DevSection_DevSubsection foreign key references DevSection(DevSectionId),
    DevSubsectionCode varchar(25) not null constraint u_DevSubsection_DevSubsectionCode unique,
        constraint ck_Dev_Subsection_Code_cannot_be_blank check(DevSubsectionCode <> ''),
    DevSubsectionName varchar(45) not null
        constraint ck_Dev_Subsection_Name_cannot_be_blank check(DevSubsectionName <> ''),
    DevSubsectionDesc varchar(1000) not null
        constraint ck_Dev_Subsection_Desc_cannot_be_blank check(DevSubsectionDesc <> ''),
    GitHubRepoName varchar(25)
       constraint ck_GitHub_RepoName_cannot_be_blank check(GitHubRepoName <> ''),
    URL varchar(250) not null default '',
    DevSubSectionSequence int not null --constraint u_DevSubsection_DevSubsectionSequence unique,
    constraint u_DevSubsection_DevSectionID_DevSubsectionName unique(DevSubsectionName, DevSectionId)
)
go


create table dbo.DevSubsectionElement(
    DevSubsectionElementId int not null identity primary key,
    DevSubsectionId int not null constraint f_DevSubsection_DevSubsectionElement foreign key references DevSubsection(DevSubsectionId),
    DevSubsectionElementCode varchar(25) not null 
    constraint ck_DevSubsectionElement_DevSubsectionElementCode_cannot_be_blank check(DevSubsectionElementCode <> ''),
    ButtonText varchar(25),
    constraint ck_DevSubsectionElement_ButtonText_cannot_be_blank check(ButtonText <> ''),
    HtmlTag varchar(10) not null,
    FileExtension varchar(5) not null,
     DevSubsectionElementPriority int not null


)
go

create table dbo.DevSubsectionTool(
    DevSubsectionToolId int not null identity primary key,
    DevSubsectionId int not null constraint fk_DevSubsection_DevSubsectionTool foreign key references DevSubsection(DevSubsectionId),
    DevToolId int not null constraint fk_DevTool_DevSubsectionTool foreign key references DevTool(DevToolId),
    constraint u_DevSubSectionTool_DevSubSectionId_DevToolId unique(DevSubsectionId, DevToolId)

)
go