/*
Profile
    pk
    firstname varchar(35)
    lastname varchar(35)
    email address varchar(50)
    phone number varchar(14)
    github account varchar(100)
    profiledesc varchar(1000)
    HasResume bit

DevTool
    pk
    DevToolName varchar(25)
    Sequence int

DevSection
    pk
    DevSectionCode varchar(25) unique
    DevSectionName varchar(35) unique
    DevSectionOverview varchar (500)
    DevSectionDesc varchar (500)
    DevSectionBlurb varchar(250)
    HasPicture bit 
    Sequence int


DevSectionTool
    pk
    DevSectionId
    DevToolId

DevSubSection
    pk
    DevSubsectionId
    DevSubSectionCode varchar (25)
    DevSubsectionName varchar(35)
    DevSubsectionDesc varchar (500)
    GitHubRepoName varchar (25)
    HasIcon bit
    HasPicture bit
    HasVideo bit
    HasSpec bit
    HasWireframe bit
    
DevSubsectionTool
    pk
    DevSubsectionId
    DevToolId





*/