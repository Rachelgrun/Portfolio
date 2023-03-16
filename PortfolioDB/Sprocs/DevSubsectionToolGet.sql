create or alter procedure dbo.DevSubsectionToolGet(

    @DevSubsectionToolId int =0,
    @All bit =0 ,
    @Message varchar(500) =''  output

)

as 
begin
select st.DevSubsectionToolId,
s.DevSubsectionId,
t.DevToolId,
s.DevSubsectionName,
t.DevToolCode,
t.DevToolName,
t.DevToolSequenceNum,
t.HasIcon
from DevSubsectionTool st
join DevSubsection s 
on s.DevSubsectionId = st.DevSubsectionId
join DevTool t 
on t.DevToolId = st.DevToolId
join DevToolType tt 
on tt.DevToolTypeId = t.DevToolTypeId
where st.DevSubsectionToolId = isnull(@DevSubsectionToolId,0)
or isnull(@All,0) =1
order by s.DevSubSectionSequence,s.DevSubsectionCode, t.DevToolSequenceNum


end
go

exec DevSubsectionToolGet @All = 1