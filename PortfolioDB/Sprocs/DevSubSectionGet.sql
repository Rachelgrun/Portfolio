create or alter procedure dbo.DevSubSectionGet(
    @DevSubSectionId int =0,
    @All bit =0,
    @Message varchar(500) = '' output
)
as 
begin
select d.DevSubsectionId,
d.DevSectionId,
s.DevSectionCode,
d.DevSubsectionCode,
d.DevSubsectionName,
d.DevSubsectionDesc,
GitHubRepoName = case when isnull(d.GitHubRepoName,'') <> '' then concat((select top 1 p.GitHubAccount from Profile p),'/',d.GitHubRepoName) else '' end,
d.DevSubSectionSequence
from DevSubSection d
join DevSection s 
on s.DevSectionId = d.DevSectionId
where isnull(@All,0)=1
or isnull(@DevSubSectionId,0)=@DevSubSectionId
order by d.DevSubSectionSequence


end
go
exec DevSubSectionGet @All =1