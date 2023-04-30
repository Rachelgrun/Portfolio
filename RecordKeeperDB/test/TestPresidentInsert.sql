--delete president where num > 46

declare @PartyId int,@PresidentId int = 0,@numval int 

select top 1 @PartyId = PartyId from Party order by PartyId

exec PresidentUpdate
@PresidentId = @PresidentId output,
@PartyId = @PartyId, 
@Num = @Numval output, 
@FirstName = 'Max', 
@LastName = 'Sax', 
@DateBorn = '01/01/1968', 
@DateDied = null, 
@TermStart = 2024, 
@TermEnd = null 

select @Numval

select * from President p order by p.num desc -- where p.PresidentId = @PresidentId


