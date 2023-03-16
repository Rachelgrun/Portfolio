Use PortfolioDB
go
select * from Profile p 
select * from DevSection d order by d.DevSectionSequenceNum
select * from DevSubsection ds
select * from DevTool 



select d.DevSectionName, ds.DevSubsectionName, t.DevToolName
from DevSection d
join DevSubsection ds
on d.DevSectionId = ds.DevSectionId
join DevSubsectionTool dst
on ds.DevSubsectionId = dst.DevSubsectionId
join DevTool t
on t.DevToolId = dst.DevToolId
order by d.DevSectionSequenceNum,ds.DevSubsectionName, t.DevToolSequenceNum

select distinct d.DevSectionName, t.DevToolName,  d.DevSectionSequenceNum, t.DevToolSequenceNum
from DevSection d
join DevSubsection ds
on d.DevSectionId = ds.DevSectionId
join DevSubsectionTool dst
on ds.DevSubsectionId = dst.DevSubsectionId
join DevTool t
on t.DevToolId = dst.DevToolId
order by d.DevSectionSequenceNum, t.DevToolSequenceNum