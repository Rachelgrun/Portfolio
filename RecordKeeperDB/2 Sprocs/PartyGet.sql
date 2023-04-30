create or ALTER PROCEDURE dbo.PartyGet(
    @PartyId int = 0,
    @PartyName varchar(35)='',
    @All bit = 0,
    @IncludeBlank bit = 0,
    @Message varchar(1000) = '' output
)
AS
begin 


select @PartyId = isnull(@PartyId,0), @All = isnull(@All,0), @IncludeBlank = isnull(@IncludeBlank,0),@PartyName = isnull(@PartyName,'')

    select p.PartyId,p.PartyName,p.Yearstarted,p.color,PresidentCount= count(r.PresidentId)
    from Party p 
    left join president r 
   on p.PartyId = r.PartyId
    where p.PartyId = @PartyId
    or @All = 1
    or p.PartyName = @PartyName
group by p.PartyId,p.PartyName,p.color,p.yearstarted
    union select 0,'',0,'',0 where @IncludeBlank = 1

    order by p.PartyName
end 

go

exec PartyGet @All = 1
exec PartyGet @All = 1,@IncludeBlank = 1
exec PartyGet @PartyId = 22
exec PartyGet @PartyName = 'Republican'