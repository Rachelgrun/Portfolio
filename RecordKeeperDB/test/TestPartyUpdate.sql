go
delete Party where PartyName = 'Tea Party'

declare @Return int, @Message varchar(1000), @PartyId int

exec @Return = PartyUpdate 
@PartyId = @PartyId output,
@PartyName = 'Tea Party',
@YearStarted = '2000',
@Color = 'LightBrown',
@Message = @Message output


select * from Party p order by p.PartyId desc

exec @Return = PartyUpdate 
@PartyId = @PartyId output,
@PartyName = 'Tea Party',
@YearStarted = '2001',
@Color = 'LightGreen',
@Message = @Message output

select * from Party p order by p.PartyId desc