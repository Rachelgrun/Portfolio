create or alter procedure dbo.PresidentGet
(@PresidentId int = 0,
@Num int = 0,
@Code varchar(250)='',
@PartyName varchar(35) = '',
@All bit = 0,
@Message varchar(1000) = '' output)
as
begin
declare @return int = 0
    select @PresidentId = ISNULL(@PresidentId,0),@All = ISNULL(@All,0),
    @Num = isnull(@Num,0),@Code = isnull(@Code,0),@PartyName = isnull(@PartyName,'')

--select @return = 1,@message = 'Hi from sproc'
--goto finished
    
    select p.PartyId,p.Code,p.PresidentId, a.PartyName, p.Num, p.FirstName, p.LastName, p.YearBorn, p.YearDied, p.TermStart, p.TermEnd,p.DateBorn,p.DateDied
    from President p 
    join Party a 
    on a.PartyId =p.PartyId
    where p.PresidentId = @PresidentId
    or @All = 1
    or p.Num =@Num
    or p.Code= @Code
    or a.PartyName = @PartyName
    order by p.Num
  -- finished:
    return @return
end

go 
exec PresidentGet @PartyName = 'Whig'
exec PresidentGet @Code = '1-George-Washington'
exec PresidentGet @Num =1
exec PresidentGet @PresidentId = 1129

exec PresidentGet @PresidentId = 1602,@All = 1

exec PresidentGet @All = 1



