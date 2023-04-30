create or alter procedure dbo.PartyDelete(
    @PartyId int = 0,
    @PartyName varchar(35) = '',
    @Message varchar(1000) = '' output
)
as
begin
    declare @Return int = 0

    select @PartyId = isnull(@PartyId,0), @PartyName = isnull(@PartyName,'')

    delete Party
    where PartyId = @PartyId
    or PartyName = @PartyName

    return @Return
end

go

declare @PartyId int = (select top 1 PartyId from Party p order by p.PartyId desc)

select * from Party p where p.PartyId = @PartyId

exec PartyDelete 
    @PartyId = @PartyId

select * from Party p where p.PartyId = @PartyId