declare @i int,@m varchar(1000), @PartyId int,@PresidentId int ,@LastName varchar(100),@Num int ,@TermEnd int,@TermStart int



select top 1 @PresidentId = p.PresidentId ,@PartyId = p.PartyId ,@LastName = reverse(p.LastName),@Num = p.Num,@TermStart = p.TermStart,@TermEnd=p.TermEnd
from president p
where p.FirstName <> 'Max'
 order by p.PresidentId desc

 select @Num = @Num + 100

select * from President p where p.PresidentId =@PresidentId

exec @i = PresidentUpdate
@PresidentId = @PresidentId,
@PartyId = @PartyId, 
@Num = @Num, 
@FirstName = 'Max', 
@LastName = @LastName,
@DateBorn = '01/01/1968', 
@DateDied = null, 
@TermStart = 2024, 
@TermEnd = null ,
@Message = @m output

select @i,@m

select * from President p where p.PresidentId =@PresidentId
